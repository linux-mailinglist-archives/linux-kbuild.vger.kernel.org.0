Return-Path: <linux-kbuild+bounces-9550-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1027BC4C88F
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Nov 2025 10:06:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 16CE73BC0C5
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Nov 2025 09:05:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 248022F1FD7;
	Tue, 11 Nov 2025 09:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UyFSIlwB"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAE1C334C15
	for <linux-kbuild@vger.kernel.org>; Tue, 11 Nov 2025 09:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762851799; cv=none; b=l+rlJ6s3vxObGBYJeaT6UPUBf/zdRDlVzMdVXflebYsqo89HUdYzQZAe0lq/u+cSIpiuL0+EiEIuhLHobYo7oOzsnxLqFGEQ7QKF6xVJHbrn/I2xxSqIe6jAIdqLlDRwptRZCfjJbtYggwRjZ+O3vV/bb9wpki/dYibL8EmvILQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762851799; c=relaxed/simple;
	bh=pvNoy8QjEGF5vDREzb9JJ0U69eI//OHw5iW0XV0TScg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t4UiOuUInuJi/8yShUbMrx33tKWVyzdyC4DArfJW7nE6DdJBpppDR82J1/Oi06qFP/yZNpakgGkgHI+4D/DLB47oWbOD9uRpV6ATs8zcfFkfw8MYgIpyImdv2+KGZcVIJ9lCdmLCh/GmBS+/W0M19D76WG6zZeVGrUWo//FYrp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UyFSIlwB; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-8804ca2a730so59064866d6.2
        for <linux-kbuild@vger.kernel.org>; Tue, 11 Nov 2025 01:03:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762851794; x=1763456594; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pvNoy8QjEGF5vDREzb9JJ0U69eI//OHw5iW0XV0TScg=;
        b=UyFSIlwBqni/WK3LjDAS7FYlHe741djJ/Stxqtrp4ECcr4d/ij7y2e20TxB3pNOE+k
         nVia7+QMOCM/Q2YE+Rcr7hm3DxiSdycZMJxdWQ3w/e4fxYc+YL4PgyfYtyh2Nk74m5Sj
         4GXBl7vlsL2zQ8wsjKeVsGxPCucHzPthtHmBV6EAQwE1UYTPYpUtJBmxcNHfMS+TrEBR
         SctNhE1TA2PahMS60wiuRST29P3fpeV19FuNarur0ywSqk8o94qPIRKDAAAa65D4EKT4
         90Tb4cRFDRw/f5wbBH1i0ofeNF+vuIiZUMJL9xxHY364kD5UNSXD16yOW7drnppEwCuM
         R9QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762851794; x=1763456594;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pvNoy8QjEGF5vDREzb9JJ0U69eI//OHw5iW0XV0TScg=;
        b=XVMLSK+gAfsH7hLwsj0GWcN/GOwg1v34zwvEuUpYmn/d8YrNYCJorxTqQ45Pkzv8U7
         5rY1PsmqeDcxqH2bHmTc8ShZvK6v1Zdo303VqtzoDsEljE0I+XpDojpDsEWrKcFeR80X
         p6CJz0gPcb5XK0MbXhFn6WTo/G8kBcdXqBsLoUch2O6prHRARZKnQDbY8gORRmU3FRUr
         aMPGCMBGsuvEoVkbLhHKcDsqozfCWBR6jnFUwqSikEUg1a9SsJWQEarLWZISadUNqyvV
         qpOOZ0mcbsRv1KIUHyv3S426hlOo9wzZyK2VK9IfWNeUmbpm/t6e5IjZTux9g7BAK5df
         4gDA==
X-Forwarded-Encrypted: i=1; AJvYcCUU3BWEFAWLmd92AbOZ2KnA5W0SCE6Ni3OuzRArDvhcbi0bxINgVsSbJr2g60qGsu3oQZvxNaZ9FNDTb5k=@vger.kernel.org
X-Gm-Message-State: AOJu0YwWLaIwqRBzDwM3LS/qIgkJO+im/tRfvNiFziBoxg01kOpUGbJg
	BjSGLe2wI5NityPQcu8TMAWHlh24yOGbODQst0JoUJ6AUT36WdGxQiqtL5TU1euTZGqQ2Da5oUk
	aboswnzdrdVqCUBSVZunQLhsUFi5dEHpVb9waC9M4
X-Gm-Gg: ASbGncvWCQaLAuqi/7pWSBs9NwlB+hmCff2KGqgFXkDfbs4eoqyZOaFm5cgzYx6CBWn
	0gGwYSklygBwpgaSo94u1Z8nle0NvJBtRPZ7JrRb132pmX12hScXZ9xqU+hku03wdLurbHxFveq
	prs1YGXoTdESwLPi1XL7ZVxC5uaQHu4nURk7NBJEwZYEcvi/NgfO2oZYBxfdXrc3ncs0WHjzuSP
	Lrt+yuwYZzHuVx63ba9sG5HsOnpNepaSu4bWhfNLKCgCZmcOYxhRi8WRibgEa/39CcB1E0LnSxf
	mWy/fI5cXCzLTdvRyxGu/7mOVQ==
X-Google-Smtp-Source: AGHT+IH4F7Ckq32jrbiUxtB1JJ5uFrJqHGgUMRdrFl5ONAv3USRRzhM1TtECqM3yfM33Ue560sqRvq2+UhD4VMC4pSM=
X-Received: by 2002:a05:6214:e42:b0:880:51ab:a3e3 with SMTP id
 6a1803df08f44-882387621d9mr168741746d6.67.1762851793588; Tue, 11 Nov 2025
 01:03:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1761763681.git.m.wieczorretman@pm.me> <0a21096d806eafa679798b9844ec33bf8a5499a4.1761763681.git.m.wieczorretman@pm.me>
In-Reply-To: <0a21096d806eafa679798b9844ec33bf8a5499a4.1761763681.git.m.wieczorretman@pm.me>
From: Alexander Potapenko <glider@google.com>
Date: Tue, 11 Nov 2025 10:02:36 +0100
X-Gm-Features: AWmQ_bncs5LVtJN1ReProGRqJJIZk54xNH4kh3rOCX8uWFHvQkLT6YYoepdGREs
Message-ID: <CAG_fn=XQPbZb4MTBUgkJ17gfQL5K1QMahaJ39Mw7Hv4zm1crXw@mail.gmail.com>
Subject: Re: [PATCH v6 16/18] arm64: Unify software tag-based KASAN inline
 recovery path
To: Maciej Wieczor-Retman <m.wieczorretman@pm.me>
Cc: xin@zytor.com, peterz@infradead.org, kaleshsingh@google.com, 
	kbingham@kernel.org, akpm@linux-foundation.org, nathan@kernel.org, 
	ryabinin.a.a@gmail.com, dave.hansen@linux.intel.com, bp@alien8.de, 
	morbo@google.com, jeremy.linton@arm.com, smostafa@google.com, kees@kernel.org, 
	baohua@kernel.org, vbabka@suse.cz, justinstitt@google.com, 
	wangkefeng.wang@huawei.com, leitao@debian.org, jan.kiszka@siemens.com, 
	fujita.tomonori@gmail.com, hpa@zytor.com, urezki@gmail.com, ubizjak@gmail.com, 
	ada.coupriediaz@arm.com, nick.desaulniers+lkml@gmail.com, ojeda@kernel.org, 
	brgerst@gmail.com, elver@google.com, pankaj.gupta@amd.com, 
	mark.rutland@arm.com, trintaeoitogc@gmail.com, jpoimboe@kernel.org, 
	thuth@redhat.com, pasha.tatashin@soleen.com, dvyukov@google.com, 
	jhubbard@nvidia.com, catalin.marinas@arm.com, yeoreum.yun@arm.com, 
	mhocko@suse.com, lorenzo.stoakes@oracle.com, samuel.holland@sifive.com, 
	vincenzo.frascino@arm.com, bigeasy@linutronix.de, surenb@google.com, 
	ardb@kernel.org, Liam.Howlett@oracle.com, nicolas.schier@linux.dev, 
	ziy@nvidia.com, kas@kernel.org, tglx@linutronix.de, mingo@redhat.com, 
	broonie@kernel.org, corbet@lwn.net, andreyknvl@gmail.com, 
	maciej.wieczor-retman@intel.com, david@redhat.com, maz@kernel.org, 
	rppt@kernel.org, will@kernel.org, luto@kernel.org, kasan-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	x86@kernel.org, linux-kbuild@vger.kernel.org, linux-mm@kvack.org, 
	llvm@lists.linux.dev, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 29, 2025 at 9:10=E2=80=AFPM Maciej Wieczor-Retman
<m.wieczorretman@pm.me> wrote:
>
> From: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
>
> To avoid having a copy of a long comment explaining the intricacies of
> the inline KASAN recovery system and issues for every architecture that
> uses the software tag-based mode, a unified kasan_die_unless_recover()
> function was added.
>
> Use kasan_die_unless_recover() in the kasan brk handler to cleanup the
> long comment, that's kept in the non-arch KASAN code.
>
> Signed-off-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
> Acked-by: Catalin Marinas <catalin.marinas@arm.com>
Acked-by: Alexander Potapenko <glider@google.com>

