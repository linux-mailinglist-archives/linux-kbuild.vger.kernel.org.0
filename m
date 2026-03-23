Return-Path: <linux-kbuild+bounces-12171-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2OeTKURTwWkYSQQAu9opvQ
	(envelope-from <linux-kbuild+bounces-12171-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Mar 2026 15:50:44 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id C3B602F54AF
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Mar 2026 15:50:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8920B302230C
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Mar 2026 14:40:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA3D73AF647;
	Mon, 23 Mar 2026 14:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Kc2yHVOK"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8394D3AE70E
	for <linux-kbuild@vger.kernel.org>; Mon, 23 Mar 2026 14:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774276758; cv=none; b=Aeltc+Z8G/hQpA8rvR8nHKkpW09R62A1Pelru8HlbGZiTNVhtijM+f85QWevpY6lISYeIb2SfnVFFr9I+GP0zz/C0jlZBHIbX3p7MbbPb0JNYo2Opezv4rPQLZa6E4rnsKvWBz9z4pGLOgPrVucpgv1qbBkB2T7M4mjOg6+Vm3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774276758; c=relaxed/simple;
	bh=nkC9ypwFSq+q2Df9+zF8ruUFWzMFZG0USFFmh2E6mas=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=bHlz4p9ohsfXJcOxDuYZ7b1nXLZZipF3BytFlJdcdrlB3qDHSS/fHjLDMBKrquYwsPI7Bmb97SVUJ6sJEEoO4R8DrZ0DWiMhBlnXVz1kRlFWUkdzi+MlezWT5M2L00+/DW9Am5YC5OKvDunGI4fERunQKCyN1UoaFkhMCpyGkjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Kc2yHVOK; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-4837b6f6b93so23808175e9.3
        for <linux-kbuild@vger.kernel.org>; Mon, 23 Mar 2026 07:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774276756; x=1774881556; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ow2cYCMn5EXbkFbtWklLmiMt9RKP3mI6kxfKs0fin8E=;
        b=Kc2yHVOK5fgtc3gEpBYsT/YtsP9IERJa+EJfY/6C9iRzaROEU2eVHPp2Lwi5yAxNs0
         gRpJfPfQ1/PAyRiSoTJx/KFbrzCPzLO77AclrvvaI7cccv+o5B4I//tBbP8dE/zLBu2f
         CNtgGonnFQkthOtogHSdtQusYTMwXp28f7HLJkF5WZwlzzj+dOnY/+HGiyrTMVMvrEHq
         1vX2IQe0MD7Qs7B7L8d8gCgXU8mLL6kxYDmttD+VZwRS4Z9/3TOLOx7a+28tA22r6RAj
         yumfBWOVa8a1Vm9+MBdxesUYCxKsNzpePTSXWX9hR4QKMS2dArscos7ZgxodZc+CY2qL
         VNAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774276756; x=1774881556;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ow2cYCMn5EXbkFbtWklLmiMt9RKP3mI6kxfKs0fin8E=;
        b=kAG085otfDM4ns4F6s17l/IaFEzxCs1yx8VKzY8e4ti2VDq1UT8sOLHaldfg28P1nN
         EojRYBBv8O/vrRLm6OAs9ykbB192XzwezgWkanIIYH0eh9a/Tss2xTpCB23QfZ+qaRis
         JIpcNSXkxnDKQI5UPtZ+IL9XYfWwyKKJQ5E1hSV8N8v3wOdDFZNno13CDHO89Yb465BF
         bJih3Y2+RgvrAdSkbDZdvBzz1BTWYHh9PeMT9ZanGQFSa4facRJwBGidMAoHCbbLHEJ+
         l3Hqeni5g5Knis5klv0HuoG/+jffCUN283nX3HJgvptbOUXLcd++/Hx5aswjjORCaYAt
         wwuA==
X-Forwarded-Encrypted: i=1; AJvYcCX5tLFj22R4/UwGUl/cJuh7XdZ44b8m/3iWoGuSwx89uL9ltMeVhAzmj+P1WMFo1psv9NiEZyNdHMF80T4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzFRaL/Kf7tYO8BE1/AKH2RcNOS6rlYUprQNBsLvCquw13sQpx8
	duGPW6M41D5TH+un+vqaGXNpU2ouuTxmdQE6rLAVlHxK8lYyfQcxA00pXm6I8BS/s+mUcObMNge
	qP89xINoBUv+uEBqTKg==
X-Received: from wmbej14.prod.google.com ([2002:a05:600c:3e8e:b0:486:fa53:8cfc])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:a43:b0:486:fbd1:9dc0 with SMTP id 5b1f17b1804b1-486fee0d52fmr164091435e9.22.1774276755701;
 Mon, 23 Mar 2026 07:39:15 -0700 (PDT)
Date: Mon, 23 Mar 2026 14:39:14 +0000
In-Reply-To: <b5063e7e-9245-434e-9877-5ac7b45f4bc7@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260322192159.88138-1-ojeda@kernel.org> <20260323000327.111235-1-ojeda@kernel.org>
 <96287f3a-d245-47cf-b7cb-f821451493d3@lunn.ch> <CANiq72nwSWVDRqm0Vap5j5X5k+Q-wq8okQ9d3KUgZt6M4CpW9g@mail.gmail.com>
 <65336ad0-ac37-416f-b6ae-e691e3e375ae@lunn.ch> <DHA6SE9EMEQF.1PKVHEG18I5FS@garyguo.net>
 <b5063e7e-9245-434e-9877-5ac7b45f4bc7@lunn.ch>
Message-ID: <acFQkuarr6bcOFwM@google.com>
Subject: Re: [PATCH v2 0/3] Inline helpers into Rust without full LTO
From: Alice Ryhl <aliceryhl@google.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Gary Guo <gary@garyguo.net>, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, a.hindborg@kernel.org, acourbot@nvidia.com, 
	akpm@linux-foundation.org, anton.ivanov@cambridgegreys.com, 
	bjorn3_gh@protonmail.com, boqun.feng@gmail.com, dakr@kernel.org, 
	david@davidgow.net, johannes@sipsolutions.net, justinstitt@google.com, 
	linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-um@lists.infradead.org, linux@armlinux.org.uk, llvm@lists.linux.dev, 
	lossin@kernel.org, mark.rutland@arm.com, mmaurer@google.com, morbo@google.com, 
	nathan@kernel.org, nick.desaulniers+lkml@gmail.com, nicolas.schier@linux.dev, 
	nsc@kernel.org, peterz@infradead.org, richard@nod.at, 
	rust-for-linux@vger.kernel.org, tmgross@umich.edu, urezki@gmail.com, 
	will@kernel.org
Content-Type: text/plain; charset="utf-8"
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-12171-lists,linux-kbuild=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[garyguo.net,gmail.com,kernel.org,nvidia.com,linux-foundation.org,cambridgegreys.com,protonmail.com,davidgow.net,sipsolutions.net,google.com,lists.infradead.org,vger.kernel.org,kvack.org,armlinux.org.uk,lists.linux.dev,arm.com,linux.dev,infradead.org,nod.at,umich.edu];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aliceryhl@google.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	RCPT_COUNT_TWELVE(0.00)[35];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: C3B602F54AF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 23, 2026 at 02:28:25PM +0100, Andrew Lunn wrote:
> > > If you want netlink on um, arm32, riscv, loongarch you would need a
> > > different implementation of the binding?
> > 
> > It doesn't need this feature to build and function. It'll just be a bit slower
> > because inlining from C to Rust won't happen.
> 
> So it sounds like my understanding is out of date. When the first
> Ethernet PHY driver was being merged, Rust could not access inline C
> functions. The binding had to replicate the functionality. But you are
> saying that Rust can now make use of inline C code, but not actually
> inline it? It results in a function call?
> 
> What this feature does it actually allows inline C functions to be
> inline? So it is just an optimisation?

That's right, this series applies cross-language inlining to the helpers
we have for calling inline functions.

Sorry if I was unclear on the netlink patch series. I mentioned this
series because you told me that inlining is important for skbuff due to
performance (not for netlink though), and this series is necessary to
make such code on par with C perf-wise. But if you accept the function
call overhead from not having cross-language inlining, this series is
not needed.

Alice

