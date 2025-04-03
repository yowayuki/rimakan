'use client';

import { redirect } from 'next/navigation';
import { FormEvent } from 'react';

type Notification = {
  id: string;
};

export default function Home() {
  const url = 'http://127.0.0.1:3000/api/v1/notification';
  const web_hook_url =
    'https://chat.googleapis.com/v1/spaces/AAAA_testURL_' +
    Math.random().toString(32).substring(2);

  async function onSubmit(event: FormEvent<HTMLFormElement>) {
    event.preventDefault();
    const formData = new FormData(event.currentTarget);
    const response = await fetch(url, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify(Object.fromEntries(formData)),
      redirect: 'follow',
    });
    const data: Notification = await response.json();
    console.log(data);
    redirect(`/notification/${data.id}`);
  }

  return (
    <div>
      <form onSubmit={onSubmit}>
        <input type='hidden' name='web_hook_url' value={web_hook_url} />
        <button type='submit'>通知ポスト</button>
      </form>
    </div>
  );
}
