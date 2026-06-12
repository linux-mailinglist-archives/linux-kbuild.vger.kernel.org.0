Return-Path: <linux-kbuild+bounces-13732-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qPxHGCS+K2qxEAQAu9opvQ
	(envelope-from <linux-kbuild+bounces-13732-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 12 Jun 2026 10:07:00 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FF02677A35
	for <lists+linux-kbuild@lfdr.de>; Fri, 12 Jun 2026 10:06:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b="v/KaT+yK";
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13732-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13732-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=google.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CE027318A211
	for <lists+linux-kbuild@lfdr.de>; Fri, 12 Jun 2026 08:00:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEC4736405A;
	Fri, 12 Jun 2026 08:00:49 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C46D2848AA
	for <linux-kbuild@vger.kernel.org>; Fri, 12 Jun 2026 08:00:47 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781251249; cv=pass; b=tp/Gtm/Q+ZfG+MvE41158QQJu9n2UL5BTFXwSt7jB/L0v486qpVz3CQnoHh9vdf23/pFufw5hrO0FHKvB3+aK7g/c2DVqEhoRDZC9F7E8Z3l3baD42LgM1BnZ1SdrrLTJBiGoJvvrjr+sXbZc/uWBv/yKSFx86DBM0/gkOALJJI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781251249; c=relaxed/simple;
	bh=KnRvALqwspnqi9RT/gX4yfpYLdFKrxcGw8Lr0DwyYvw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IVKMfF7my1u66aw6YS546tDmm3t9PqinnZ/P/Ag+IbX1hIzsGAuGBKb+PG1PAgaoin70gBGTOCguSoZg2oHN01dR1xYYez523+mD+5L/UOaOPbJEIGLqXR6gm/XZy+pCVJ/EMGcii04MMlrfm1b5X/EZVxphdwZHic5MXl9Coss=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=v/KaT+yK; arc=pass smtp.client-ip=209.85.128.170
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-7de68222e96so5308977b3.2
        for <linux-kbuild@vger.kernel.org>; Fri, 12 Jun 2026 01:00:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781251246; cv=none;
        d=google.com; s=arc-20240605;
        b=ZkSTuGpCn2fbKDPMYbWl4Im9cLTK8x6IkClf2C2as8l0RqjWYz3WkQn6+IGmFUOkjX
         Jyu4hu7X3Qne7ROY5jLAUWEdKJaWBz19xKCBNMWp9Q/m5LmIgGPmM+zkK1pStGjZdcI6
         oOZqKuI8pAnK6jqD7lrySeT9PsSLBcNsLsEf34T2KoaR75weW3M8tRgb6PNC4c2zknOk
         IhBFyw0pHK+T+kvoWVY1lpsokFm8cbaddt7XeqnivtS2hKu0eUSDDYl9sNs4mG2KHcoD
         y//vpDaUes6fCSpcM11vceHmbOYcoT0Xm03sDUdnoon17nLOi/lmT2esjG2xYFCc+OF/
         0u6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KnRvALqwspnqi9RT/gX4yfpYLdFKrxcGw8Lr0DwyYvw=;
        fh=yHxE31oJd58ZWoLuZfXfKxN/BOtHrzZzkXtAWGcFUfo=;
        b=Jbr14RpVaNyBPpCI0UkFEKHCx5v8plEg9ozi+2zs6xRvoWNNd9ol6zBfqkZx9IDKwt
         nokXvmnLu6yLNpdYAWt4SZiSSNLO/zW1ev+xKHEZCP264JDH2WZwcNlq/vsyRTiegtGe
         888Yj8ugVMzf7Tc0XSKp3RFRuTpQPE7oZS0rLlYGh5M2EbS8rFIDr0l9Opj9P4fPZqvE
         KC2DUBdaaCFeM+Hidm5IBMdq6H5O/zvFQHq04fWuMOLbTHayArLE0QicQKenMu1Lkmwj
         V/pZ4ProfNu6mY3tQEI370Pny3oYpa4mv4yofV2wYnOnRgk//HwGSJ8WEReuJcP2ydSd
         ToAw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781251246; x=1781856046; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KnRvALqwspnqi9RT/gX4yfpYLdFKrxcGw8Lr0DwyYvw=;
        b=v/KaT+yKVuYKxugk9GOkU+ByBS5tAuu8BM52P0ROYU/zA36UgpEdVVgn/Siw7JATqN
         eJF4aDW9cpF4phgd8eNvDOGOd9fp9S8mgtqPR02h49maNhy6DW+9FDBxBrjYkfilUXtp
         173US70nRQrPQjMz5ChJs4F6QYj0e7NO90jIwHXCCGmxmrKjfghm4AUxd6eNSQnUkwhv
         qhzkHeddM8HkbCVyqW5biYj9jbh+zqe62E968ClSB4V9Jym2H+hq4cbAz5RcxrpaBwN0
         YrF2QYkryG1AYMaCgXfsQ29oUL+6fvYeXb34RP+xlfGbfPJUeBhB9XEnPQWC03zgAE84
         CQew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781251246; x=1781856046;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KnRvALqwspnqi9RT/gX4yfpYLdFKrxcGw8Lr0DwyYvw=;
        b=gUzDuPwx4cFTq00vxJ15eI403p2eFzT7z3FUsTrYSAJOPJEgy6vntqN4ELivA/A0wf
         oxq8ax0LUToObJOL2BJOMqg9rd4bb3VgATXUBfSesmJCJqWga8waR0DiQhEeW2g4LwXl
         C27VJBLedzWrcwKPaZwLKucxqJPHLVd6w1KENwqqjqhlD0EU/JAVaQPt3j6HBcpar+T6
         AlT1h4XRyp4Z3ZmgdyiZyzwI1e/7ZaqttWdDZqOj+Vjpn+M9MizDYH9NoXv/xtOqRiqU
         u8z7vDPWHtirGoxnaHk0sHzFIpePZpfRurjOgngY8HWNQMZjaU9Y6IJaT1/sLijvKBpi
         DKCw==
X-Forwarded-Encrypted: i=1; AFNElJ/plZZ1pr4dnCtO21tnW/JDrFCvyb3AJDSnCPUnfkibvBxYQZJMaifMez6OJT2XBoxRDCldOG0TaFTizw0=@vger.kernel.org
X-Gm-Message-State: AOJu0YygPay/8EtavylX1DSbvyDFMBQE/Lkmv8XTA/PHUw+TCILjfMWS
	4Tlup/Q0+/5lgdTqYBHjDUZUvcmKZLCtCpnZYOcw1Y5w9kVUZ0qUBZ/ohfB/Ci1XXRy3du9ZSQK
	En6MkVzfT9T+luA/P68piBaIOuEO2tIMm5PwgDH52
X-Gm-Gg: Acq92OGKLS85TfdGWxmvfJBpqcbaxOkj+KKOJ9C0a+uhSMRzSLsRPkEmAWOb0DK2ln+
	n10ryQ0UVfWZi/DugH3uzhERdis5/teu5ZVM8gvVm65tVpldB01+pHfsNDvRdxbj/jLpOzo+2Gr
	XWUevoEhd8GFq1WVilmNmzC/nTb3Hoac3W6JnaEYkxO0RrBTVN3uaM9MQDlRcw5K4EKACszhQ28
	VlFpJ6J/Rncoxs7V4NmiDTQuHoB0H7YbppShWCM87QpzIh1aSoqmptCtBfa06Q2wnFGRt24l3VS
	GLbsaPMrxlpYhCWRETsDE0XcGYR2VgpwlZIW7Q==
X-Received: by 2002:a05:690c:6201:b0:7db:f8b1:cd80 with SMTP id
 00721157ae682-7f7bac02970mr15863297b3.2.1781251245971; Fri, 12 Jun 2026
 01:00:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260611-b4-kcov-dataflow-v2-v2-0-0a261da3987c@est.tech>
 <20260611-b4-kcov-dataflow-v2-v2-2-0a261da3987c@est.tech> <CAG_fn=V1+_xLgCZgdLnT7Y-muRO0CXkrNKkC8AzrqzWoL4eR8w@mail.gmail.com>
 <5fa7a528-a4c5-4fdb-9a17-1b0992e955b3@est.tech>
In-Reply-To: <5fa7a528-a4c5-4fdb-9a17-1b0992e955b3@est.tech>
From: Alexander Potapenko <glider@google.com>
Date: Fri, 12 Jun 2026 10:00:07 +0200
X-Gm-Features: AVVi8CdEFjoun-R64CqbvYJPTnaS_E7TDNryUpyw-2UHJoZxcDfdiOQP2RCPBTE
Message-ID: <CAG_fn=XB7_zbjGzpgwEzm5dqcwehqvB+=SpJhHvw9QdETberAg@mail.gmail.com>
Subject: Re: [RFC PATCH v2 02/14] kcov: fix INIT_TRACK race in kcov_dataflow
To: Yunseong Kim <yunseong.kim@est.tech>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>, 
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, linux-kernel@vger.kernel.org, 
	kasan-dev@googlegroups.com, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, Yeoreum Yun <yeoreum.yun@arm.com>, 
	sashiko-bot <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[redhat.com,infradead.org,linaro.org,arm.com,goodmis.org,google.com,suse.de,amd.com,gmail.com,linux-foundation.org,kernel.org,garyguo.net,protonmail.com,umich.edu,suse.com,lwn.net,linuxfoundation.org,vger.kernel.org,googlegroups.com,lists.linux.dev,kvack.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13732-lists,linux-kbuild=lfdr.de];
	SEM_URIBL_UNKNOWN_FAIL(0.00)[mail.gmail.com:query timed out,vger.kernel.org:query timed out];
	FORGED_RECIPIENTS(0.00)[m:yunseong.kim@est.tech,m:mingo@redhat.com,m:peterz@infradead.org,m:juri.lelli@redhat.com,m:vincent.guittot@linaro.org,m:dietmar.eggemann@arm.com,m:rostedt@goodmis.org,m:bsegall@google.com,m:mgorman@suse.de,m:vschneid@redhat.com,m:kprateek.nayak@amd.com,m:andreyknvl@gmail.com,m:dvyukov@google.com,m:akpm@linux-foundation.org,m:ojeda@kernel.org,m:boqun@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:dakr@kernel.org,m:nathan@kernel.org,m:nsc@kernel.org,m:nick.desaulniers+lkml@gmail.com,m:morbo@google.com,m:justinstitt@google.com,m:kees@kernel.org,m:david@kernel.org,m:ljs@kernel.org,m:liam@infradead.org,m:vbabka@kernel.org,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:shuah@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:linux-kernel@vger.kernel.org,m:kasan-dev@googlegroups.com,m:rust-for-linux@vger.kernel.org,m:linux-kbuild@vger.kernel.org,m:ll
 vm@lists.linux.dev,m:linux-mm@kvack.org,m:linux-kselftest@vger.kernel.org,m:workflows@vger.kernel.org,m:linux-doc@vger.kernel.org,m:yeoreum.yun@arm.com,m:sashiko-bot@kernel.org,m:nickdesaulniers@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[glider@google.com,linux-kbuild@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[google.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	SEM_URIBL_FRESH15_UNKNOWN_FAIL(0.00)[vger.kernel.org:query timed out,mail.gmail.com:query timed out];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[glider@google.com,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[50];
	RBL_SEM_IPV6_FAIL(0.00)[2600:3c04:e001:36c::12fc:5321:server fail];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,mail.gmail.com:mid,sashiko.dev:url,vger.kernel.org:from_smtp,est.tech:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0FF02677A35

On Fri, Jun 12, 2026 at 9:25=E2=80=AFAM Yunseong Kim <yunseong.kim@est.tech=
> wrote:
>
> Hi Alexander,
>
> > On Thu, Jun 11, 2026 at 6:21=E2=80=AFPM Yunseong Kim <yunseong.kim@est.=
tech> wrote:
> >>
> >> [snip...]
> >> Reported-by: sashiko-bot <sashiko-bot@kernel.org>
> >> Closes: https://sashiko.dev/#/patchset/20260603-kcov-dataflow-next-202=
60603-v2-0-fee0939de2c4%40est.tech
> >> Signed-off-by: Yunseong Kim <yunseong.kim@est.tech>
> >
> > Can we please avoid this?
> > kcov_dataflow.c is being introduced in the same series, there is no
> > need to send a buggy commit and a follow-up fix - just squash the two
> > together and note the changes after Signed-off-by: separated by a
> > triple dash.
>
> Thank you for your guide. I'll remove it in the next patch set.
Also please make sure to update the patch version. It's really hard to
distinguish between "[RFC PATCH v2 n/6]" and "[RFC PATCH v2 m/14]"
when both series pop up in the inbox.

