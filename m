Return-Path: <linux-kbuild+bounces-11531-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wPMiCzfKpmk0TwAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11531-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 03 Mar 2026 12:47:03 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id CCBEA1EE78D
	for <lists+linux-kbuild@lfdr.de>; Tue, 03 Mar 2026 12:47:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 44AA13043BF8
	for <lists+linux-kbuild@lfdr.de>; Tue,  3 Mar 2026 11:44:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E51E288D6;
	Tue,  3 Mar 2026 11:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Cvqh1bpC"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57CE733C1BD
	for <linux-kbuild@vger.kernel.org>; Tue,  3 Mar 2026 11:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772537951; cv=none; b=DY6c/V6Q37X6RRRVJ3cVuQ+Dfo64tusvdCpVOVB+xmJCW69umZgui9wPH/V4D/XhUr69sUtz9CCaSzvFD6XSJrdeUvx/cBKQbBjHqDJ2YbTfGJbF7cQkOb/meAw+cSuIocm9/J/IJaGQNbzrZ8/j5z6y/ZlohhjD/1KwDhio8IU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772537951; c=relaxed/simple;
	bh=SOkN8YVRNPjTfsz/PejMeq0iowgdTuG0HqfQGfFGgEs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=qhlA6aEZ0Q7e36hEgzNRJ473RMwJz8J8hFuDCvU5Z2FIfiCRtj+Zuak6ea4NhQ20ox3vtwsHKFHr0Mu18BRdyFmCSbC4djd4tx2EFHIdYMFttU4VZXNOCs0MuxZ4paelqiwxxF6VKc/YOCTu3yE4TR0xjVywVFZnZsT/ZbgTk18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Cvqh1bpC; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-4837c597cd5so33920525e9.3
        for <linux-kbuild@vger.kernel.org>; Tue, 03 Mar 2026 03:39:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772537949; x=1773142749; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Kh33YTVJdNdb4rfed7VKp0A1E6qzkpd9sZhD0bYZ4Vs=;
        b=Cvqh1bpC6d1xy/LrYmXaCBkxgKpotSkzc2Yl8ic9wYiv7bxTXsS6PXwpyA9m9zBuC+
         Oc7YsKkODvTSsE3T14CM6N5fOFFUj/5YjtAjgfmUwew+/6LpYeE5vrEFxiKXfFrKmpv/
         oXZ2lvR7qYbeOzCV9+M7DjSDKrzPJO0f1YkJnl/JDG8M7f+mvMoKlZz3kvRYK+DW6a70
         1Oy+8bkIwRB7F/hI2Dsusg1TbY8pPE8th2Ne6u7e9c1qTiwpgxH/BB4mIrl+7BfbfGCq
         x6uYtoaS2+ctcQFg3nG1RVlqjQ2UYUsTXYS1pbIppd57cKqO0dxdRqBvlAuaTWDZcsL2
         WMnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772537949; x=1773142749;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Kh33YTVJdNdb4rfed7VKp0A1E6qzkpd9sZhD0bYZ4Vs=;
        b=Xg+VlrukvTU4CTaMQsIyDVH3dNZiZO7aRXFQyFCI4jEHIBGM1R0UzPpiN+LlcgwtLd
         f9mqMxJQn+3YOvTUGx01dTEsNQXH1BufE6AQLyh1IHtt+XkZY6r4i669ext21bGJF+OR
         mBYQ588DAloRk/vqWA+ZqrsIWb3K9WQNZYEzN6/KrVU5HfHVd4PVuLhpMGo0LlVdJojQ
         TEJaXUnAPWLxzTzoBJZfS0QzpnMKSz+F6hpPlrQRWvGFZcwvcSRXyXC3LobOsdBg4EoF
         iyqhzBKJQBq++/Vqalg4yKO5ascwdw3VyXYVVWfLe/5G2lSd6kJXUPQq2VBeXgaQ9CiE
         v4Ag==
X-Forwarded-Encrypted: i=1; AJvYcCX4dLsw5uHQTG2w3f1wR/qkL+fkk6ZHF2YPfvkRKw0nPqymFmmWsm2uHwYVkDxCLONysoMgieEJHwviMP8=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywd49fdyVjaSxHOxtsTMx+mgM23ixumNUkGEpGeICG54jTAwGD/
	FFyGAQVHErut3c1hf+l2vRCKR3L4pzbL4pGlm+KQVLbwhnmlgRckGvnkkwkmbzqiYR6rN1CnDhr
	ukZSFS1lX2hWi+5wYVA==
X-Received: from wmbjv25.prod.google.com ([2002:a05:600c:5719:b0:480:6a27:9ec2])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3106:b0:47a:7fd0:9eea with SMTP id 5b1f17b1804b1-483c9ba610fmr259196275e9.3.1772537948481;
 Tue, 03 Mar 2026 03:39:08 -0800 (PST)
Date: Tue, 3 Mar 2026 11:39:07 +0000
In-Reply-To: <DGT2IKQK341C.35HW6HHSB03KL@garyguo.net>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260302130223.134058-1-gary@kernel.org> <20260302130223.134058-2-gary@kernel.org>
 <DGSDGDIVUHO0.P594H9B4LLO5@kernel.org> <DGSDOKRKSKQL.2NQL17J05GGX2@garyguo.net>
 <DGSISB2SQHWM.D8OGH4JJHIRP@kernel.org> <DGSKLQ9WMRID.3ILNUUEITA48K@garyguo.net>
 <DGSMV5Z3PW5O.3NBTRGX8CK8WB@kernel.org> <DGSN9C8PBFYP.2T48HOEE5LXSM@garyguo.net>
 <DGT16NCR2TD7.27E74897D8XEC@kernel.org> <DGT2IKQK341C.35HW6HHSB03KL@garyguo.net>
Message-ID: <aabIW4RNCgSyY945@google.com>
Subject: Re: [PATCH v3 1/2] rust: add projection infrastructure
From: Alice Ryhl <aliceryhl@google.com>
To: Gary Guo <gary@garyguo.net>
Cc: Benno Lossin <lossin@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, rust-for-linux@vger.kernel.org, 
	Aditya Rajan <adi.dev.github@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
X-Rspamd-Queue-Id: CCBEA1EE78D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11531-lists,linux-kbuild=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,protonmail.com,umich.edu,vger.kernel.org,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aliceryhl@google.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Tue, Mar 03, 2026 at 10:17:01AM +0000, Gary Guo wrote:
> On Tue Mar 3, 2026 at 9:14 AM GMT, Benno Lossin wrote:
> > On Mon Mar 2, 2026 at 11:19 PM CET, Gary Guo wrote:
> >> I am basically just having `size_of_val_raw` in mind when writing this. So the
> >> current `KnownSize` comment in v4 is something that I am happy about.
> >
> > Well size_of_val_raw is `unsafe` and only valid to call in certain
> > conditions. It asks in the case of slices that the length is an
> > initialized integer and that the entire value must fit into `isize`.
> > This to me just further indicates that `*mut T` has safety
> > requirements to obtaining the size of an arbitrary pointer.
> >
> > In the special cases of `T: Sized` and `T == [U]`, we have safe ways of
> > getting their size.
> 
> Hmm, the `isize` fitting requirement is problematic indeed. It's broken code if
> pointer projection is used with an allocation that exceeds the limit, but I want
> the API to be safe, so it'll be good if the API is defined to just be wrapping
> and safe (it may return values that doesn't make sense, but that'll be on the
> user).
> 
> Anyhow this is moot as we're going the `KnownSize` route.

It sounds like that's no different from dyn trait vtable case. Fat
pointer must have valid metadata, even if raw pointer.

Alice

