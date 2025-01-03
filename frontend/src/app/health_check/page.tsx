'use client';

import type { NextPage } from 'next';
import useSWR from 'swr';
import { fetcher } from '@/utils/fetcher';

const Index: NextPage = () => {
  const url = 'http://127.0.0.1:3000/api/v1/health_check';
  const { data, error } = useSWR(url, fetcher);

  if (error) return <div>An error has occurred.</div>;
  if (!data) return <div>Loading...</div>;

  return (
    <>
      <div>Rails疎通確認</div>
      <div>レスポンスメッセージ: {data.message}</div>
    </>
  );
};

export default Index;
