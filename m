Return-Path: <linux-kbuild+bounces-9511-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A706AC46DB0
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Nov 2025 14:23:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4380818916C0
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Nov 2025 13:23:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAB99303A22;
	Mon, 10 Nov 2025 13:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Burq4hu4"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60B2B310630
	for <linux-kbuild@vger.kernel.org>; Mon, 10 Nov 2025 13:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762780988; cv=none; b=kxQvdEhN4eoLc9rd1Gyv2XTu/t9bUnRUOZYSnoM2vf4syAGUT097OrsJLiyPV9zpUt/n5DUENylFunQQYnNlMUpwSg3XYj3yQAYOVgnorAadvE57a5UCpRA3axTj3tNrZv5KjWiUA4bkRSC2KyvzRq+iUUb7IC09jZMSr9XYIeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762780988; c=relaxed/simple;
	bh=C3acuH7QCQn6p/xm12ErSwRFYfxoFjG9C3ZXOi4OU58=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dycPUTJ1CB6mo9qHRFWssTpPftYK8xoiJI+IBTH24lGetlJQRZNJARupmqRoGmVoeO50C9r16v7mxp+Yky6ufBUXaFwuk2016G04taK7Fwb5XQjt2J9EVKwHUeWH1PwGIy/jA60Ix/MO04RiLKM/3LGqf131CpPI/vKqv2azoFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Burq4hu4; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-29806bd4776so2447725ad.0
        for <linux-kbuild@vger.kernel.org>; Mon, 10 Nov 2025 05:23:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762780987; x=1763385787; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C3acuH7QCQn6p/xm12ErSwRFYfxoFjG9C3ZXOi4OU58=;
        b=Burq4hu4SRCBWq8IvkWShcKVmRVrUTLWS7G9dZOSs2N/qYDza1aDQqyf03HNvmGacX
         Sxnkm3AHK/y3AJlQsp9K9x7l0K9IYHDPfOIxZ4MVx7MAeBknIpXWlOoRDPO3soEdB3L1
         Q116CAnfikEAhQDMoh+oaOngx/ylvAjIa2depsQOaWxLllXoH3qbHDVFbelkeKXMipVL
         mUTFT155DQzvatbbU2jndpqmroGdOvyLfMXZ/6UDbcmkmi6QosoBrgx1upouDCM78V6U
         sJUjml6KJvwAn/YiQXbtUIL3sX6pRMmbLwF+fUljKRjJDnmzXxrDfB1j4+NRjQAFUl9/
         +v8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762780987; x=1763385787;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=C3acuH7QCQn6p/xm12ErSwRFYfxoFjG9C3ZXOi4OU58=;
        b=WCtUoWpCTWdlBL8w15GlJkjayuOmBnrr6SLge5pUjyzkSZE0H9zOGaA2BI7/q4D7LV
         jRm7YY+Kw0DAKU7nteiz1rQ1XiTFQfkDr7K0iTIVlRh0nBt2Lr88qavPstB3dG5R2efY
         QQICultMquO+JnW73FMoFggkTR3AEJObMVT+vFknM3QB4PyrSHygTe/atBPr3Hq72X+P
         lHDTAMPezknDLg7kwOC88hqXDmYblH2cu+ciMsmcd+p4GXS0g9cwcqoZdDtqZ8dLXooE
         KEXzKwnRVqwCt2nQeXfuzUYdtvZLU3JjoWjsiSA9G9vMUyqPFpHFZ6Qa9ZNQ2csn5//c
         Az0A==
X-Forwarded-Encrypted: i=1; AJvYcCWNoKg7v6mx88r+obLS+tEHMpYqpZz1tbe9CDNsMviwOrU6hJNE6FeZEaUtX7LFwOEdiTc2spaqqUCGDto=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxg6f9MoY/PtsRxQcwDe8+3SXHdA2NULK02/62bHRH52scqW+EN
	g7LtMm3lu1v6padMPFWSxQIULct6+txVPQdb5KHvzy9ZWBNoCOjY6lk1JQSc7hFCIToet5XrTV8
	McLvbCX4XOV3Y1iS8HolIID1yuU30lcw=
X-Gm-Gg: ASbGncvsFPl9Jt6asxqH1xjq7scP5EXB8BML9HUEKcf1RteSgatATQeAwfhWuaVPdv9
	Sz7WIp45kCqWJQV2qXncdPsYC0w90oePSP9jmPRBgMto6jg2vF8adAbKVdA86GErgM+rImxbQjn
	1hwWQWF1Q+OmF+Rbrw9LlHzO55TYCBaNuJb4+WBO9RnTIj6wRP7hKqTD5n2Hg5bRB/XStBykkVE
	Xip3PDZZa/e38XPcnziQLt6wPIhvN3GWhpBrg3/JpMVTJvn40gMoFyGgYjTQqeA6K5bPfuacudY
	PTVStBVeU5WJfjnfonuO+BdJ++4xs2UqPNPmWal8n+/4hlr4ePx8JdjDWhfdDmQx/HO6ROSwW64
	sGaM=
X-Google-Smtp-Source: AGHT+IHgHDi3q6OyQUJsolTQIPR9Fj/+81SVNx0MCb8IGd9foxsR78ymwzqgxKrlTwxxt2S941IeTNAE2DlJ0icIPNk=
X-Received: by 2002:a17:902:e809:b0:297:f2a0:fad6 with SMTP id
 d9443c01a7336-297f2a0fc40mr54637915ad.9.1762780986630; Mon, 10 Nov 2025
 05:23:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251110095025.1475896-1-ojeda@kernel.org> <20251110095025.1475896-14-ojeda@kernel.org>
 <aRHQA6FEoxACerIQ@google.com> <20251110131326.309545df@eugeo>
In-Reply-To: <20251110131326.309545df@eugeo>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 10 Nov 2025 14:22:53 +0100
X-Gm-Features: AWmQ_blPKQ1VNfZu1Ux9YpaOP8DxeSL_ehdyoNT5qQqWUnszwlBjdrKVMppjRig
Message-ID: <CANiq72nkjWbtEktSU_TrEfY2Agy7FK0-OLBWPLqTvp_p-CkBUg@mail.gmail.com>
Subject: Re: [PATCH 13/18] rust: quote: enable support in kbuild
To: Gary Guo <gary@garyguo.net>
Cc: Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Boqun Feng <boqun.feng@gmail.com>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 10, 2025 at 2:13=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> This is to be able to skip over edition flags for `quote` when building
> the rusttestlib?

Yes, it is needed to support skipping the flags, which isn't needed
until this patch.

It can be done earlier separately since it doesn't hurt -- a simpler
option is just to mention it here in the log.

Cheers,
Miguel

