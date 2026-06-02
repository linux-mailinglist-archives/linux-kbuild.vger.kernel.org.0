Return-Path: <linux-kbuild+bounces-13530-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id rmXoBEwhH2pOhQAAu9opvQ
	(envelope-from <linux-kbuild+bounces-13530-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 02 Jun 2026 20:30:36 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id DD1B7631152
	for <lists+linux-kbuild@lfdr.de>; Tue, 02 Jun 2026 20:30:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linux.dev header.s=key1 header.b=LtOmS7d5;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13530-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13530-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linux.dev;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 009173004059
	for <lists+linux-kbuild@lfdr.de>; Tue,  2 Jun 2026 18:30:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAC85223DC6;
	Tue,  2 Jun 2026 18:30:26 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from out-172.mta0.migadu.com (out-172.mta0.migadu.com [91.218.175.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63029395ACE
	for <linux-kbuild@vger.kernel.org>; Tue,  2 Jun 2026 18:30:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780425026; cv=none; b=hvX9aXQYl9ViArYDsVSySw/qNmvDlkNiRPRpM5vPq54eUFrR37XOAiNZLWINmmlzZaX+ThoSk9FsKEOJOGhKMRZivs0h8HAWPW6vW4rivuJlOhoVMFovzsTuVb+jIYjvqfbxhKUhyDenimrMFq+Jex25R7FnzQGxRx0t1cgXVRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780425026; c=relaxed/simple;
	bh=t2Vy1eH2AXireiIjYSHr/B6Xt78hGehzQS23aX0vSTo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Mn8ZTE6aAbrQ1Ro/2vIqaPXMATxQyCs97W3ZWq8Ww6cyijir8DdE7CUjM35RIEuYw7RU0R5EvEP4mUM+w8kvYVjX+KtF/7qhAv1uaAIDe4xG3R7y1/FJSiBMY4K9VykNLizMEed7OG9YrUhzn0PHhBNpeTcKYlY2cle0vGVIEzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=LtOmS7d5; arc=none smtp.client-ip=91.218.175.172
Message-ID: <7d1a75e4-a2f8-40a2-bd03-405b85b0a846@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1780425023;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=95UKYabNJOEIeppEfTxbhbxJbizXLVR+134W7NVUtjc=;
	b=LtOmS7d55QLTvO6NoSwt90RlEUbEmB0L+A1PADSpmiKSI+/zGNvtmodDs3OXpcuJ4dWKuJ
	IXPDAeYHAa0Qt01ManfpTP+lW9LXOmCcCT7uPx2HtLb5tMoXJHZtw6zx3ouRTkH52euXWE
	Gec1TvL33YYMFmK6w6qQiegi8Xh15PI=
Date: Tue, 2 Jun 2026 11:30:15 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH bpf-next v1 02/14] selftests/bpf: Modernize resolve_btfids
 test scaffolding
To: Jiri Olsa <olsajiri@gmail.com>
Cc: Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Eduard Zingerman
 <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>,
 Alan Maguire <alan.maguire@oracle.com>, bpf@vger.kernel.org,
 linux-kbuild@vger.kernel.org
References: <20260601221805.821394-1-ihor.solodrai@linux.dev>
 <20260601221805.821394-3-ihor.solodrai@linux.dev> <ah7UVZLgsBcLDnkJ@krava>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Ihor Solodrai <ihor.solodrai@linux.dev>
In-Reply-To: <ah7UVZLgsBcLDnkJ@krava>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,iogearbox.net,gmail.com,oracle.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-13530-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_TO(0.00)[gmail.com];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:olsajiri@gmail.com,m:ast@kernel.org,m:andrii@kernel.org,m:daniel@iogearbox.net,m:eddyz87@gmail.com,m:memxor@gmail.com,m:alan.maguire@oracle.com,m:bpf@vger.kernel.org,m:linux-kbuild@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[ihor.solodrai@linux.dev,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[linux.dev:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ihor.solodrai@linux.dev,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MID_RHS_MATCH_FROM(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DD1B7631152

On 6/2/26 6:02 AM, Jiri Olsa wrote:
> On Mon, Jun 01, 2026 at 03:17:53PM -0700, Ihor Solodrai wrote:
> 
> SNIP
> 
>> -static int resolve_symbols(void)
>> +static int resolve_symbols(struct btf *btf)
>>  {
>> -	struct btf *btf;
>> +	__u32 nr = btf__type_cnt(btf);
>>  	int type_id;
>> -	__u32 nr;
>> -
>> -	btf = btf__parse_raw("resolve_btfids.test.o.BTF");
>> -	if (CHECK(libbpf_get_error(btf), "resolve",
>> -		  "Failed to load BTF from resolve_btfids.test.o.BTF\n"))
>> -		return -1;
>> -
>> -	nr = btf__type_cnt(btf);
>>  
>>  	for (type_id = 1; type_id < nr; type_id++) {
>>  		if (__resolve_symbol(btf, type_id))
> 
> I think __resolve_symbol uses PRINT_FAIL instead of ASSERT

You're right, I missed that. Thanks.

> 
>> [...]


