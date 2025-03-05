Return-Path: <linux-kbuild+bounces-5967-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A3BDA4FEF9
	for <lists+linux-kbuild@lfdr.de>; Wed,  5 Mar 2025 13:47:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9B0723ACB83
	for <lists+linux-kbuild@lfdr.de>; Wed,  5 Mar 2025 12:47:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB26C1FCF6D;
	Wed,  5 Mar 2025 12:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PyBpq2w6"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BBF113633F;
	Wed,  5 Mar 2025 12:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741178869; cv=none; b=g9Cuf/wjlY0/cbMopc4KWRLbBJ82SU1wL4yhpSAbQUIoX0XRNtH5CSPlJdbIKbOKiU6MYeZnOp7WFPXlPbdEP18dukRfmfVFtwYBXNptxdSAp2/4SeqNMZspW9IglD5QgJIjxTfmams6dpysFFSNdI5Wc4GS3JnNWEgVvuYdZ8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741178869; c=relaxed/simple;
	bh=XfXFTTGp1QVFV98VxMX0zwHYNo/nftzqQspqCemC3fk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KKl+qDaYnAmfO1yPyyDrVtELcZ1OJxM4UhSyd/IFZ+fCFGCMjE42jAVsukySZUTAzX+l3L89cMTaw95qI2JxEdgaVH17/+iVrA+goJuIFr3/umSNlamfwWinUk7f0fptw1BfsDnnEpMnYI2Ut5OKUemjvpS1zaISqXWHrSOgLXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PyBpq2w6; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2fee688b474so861633a91.3;
        Wed, 05 Mar 2025 04:47:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741178868; x=1741783668; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XfXFTTGp1QVFV98VxMX0zwHYNo/nftzqQspqCemC3fk=;
        b=PyBpq2w6WoXsptN67xAYeRJya/ycZiDE6I3z/HWCblUWDz7dx169XkQElZPwOdblqE
         2lU5urN8nmFhmDoBtykq9Bxa/XMWF1WaW3/WcfZD8TCHf/i+qIsRJzEnu+ExEfKzGhaM
         8vZZgQlMedgO2U0II5Chnkw4iBBoQz6BiBNN7kWxaZUYAptTJe98lVUvmg+skl1gDb7M
         PCq52au+KYtvDTqZW5i5VYMASpwz/4ekw96QHjpaV7BjZ/bSjoTJEvdV2cwJTDkG5xAC
         Ne8+Coqbq3iL6dvshm6/ITMzN5bxCtzDTjOVEWVVZ+dVcCoybeJ5ku3Rt2LRku1taUch
         teVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741178868; x=1741783668;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XfXFTTGp1QVFV98VxMX0zwHYNo/nftzqQspqCemC3fk=;
        b=hseUyHSoLTtFwv3UCg031EzIVmuS6At82HsjNTODE2ofCQT5UHIbOJJXaLDdKep4mv
         Q1TpxkcznqEKbnfUfFf5RIcR0r06EThViJbhKUCflqlJMgLDOevx68mdse32ZniceyDu
         Id1LLVZnt8yRzHXP79prQHc5qePqE1wqPnWzEPQtggDvWn5c6dPLYfly1R5INrUUs2PZ
         Qz8bLYrWSFuoucoJ4ZFLdTNHi7sNY5lwPYBfZ6N3fDWA6z7JWuquKIiHzdZhH/cNVHh7
         wQvXfPlWZFFZlwaro7fQRY4ndwsI7IPknzI2HH4Pj5Ks7R6RSrEjm+4pP7WQxTkpaFAw
         735w==
X-Forwarded-Encrypted: i=1; AJvYcCVLYIS5L/AjoCMNj0ngdfkjdU6wxOuP/iZ/8c4BQFOsRx8sJceTjX8fQHGXEM5uDxIrSZTD4t3aCi6UZhF7@vger.kernel.org, AJvYcCVwjmTGAkbgZO/UG60lDtCCqWVcB6+6Pe3QyYvKHAQDCsg3mHIi7sh66fLF632kGd/0j+yDbgFwPJnin30=@vger.kernel.org, AJvYcCW9IYVDGXuuNcV3bQEueheMdboGVvqIReR5TsYcodpeIOWUinmWsLjyD2XIgrz+UMtzTh4htPJ/T7cBlcWUSVQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyY54FVg1WAmjivWDEzy1TsceiJq0EWrb5SuWZDoaL/FSRLsP6n
	3mlqrl5fmp+SzgsdYSNEFfinpbpOocf4jKYWBsGBmaWD5XgaIpKIXMxSfHx6v0eU7MtX218xc96
	apDkbGdM6fD6lOJohhSvCHOwobUw=
X-Gm-Gg: ASbGnctgs82nnFy5HLF3jBS++DfCcjLmQKvtQUfbdsYAuXZLuqkY5I/nkuOWum38py2
	tlHcQSt52EgdmcdtG9kp//w1A73KijCurg7XzAcuiiLRdrtfrbjeXWyXvLbshYwzoBLQq8uS/IN
	PJnHevMzJNm476Fsz7n7hYxNFBNw==
X-Google-Smtp-Source: AGHT+IHR6wKMB4APddqt0jTu3j3PDlKIsQUgPx7zctPz/rbSum8GUWLgU6G0Oqw4f3Kok/VN9N6g+KQ774Dx5rxv9H8=
X-Received: by 2002:a17:90b:4c0b:b0:2fe:957c:1146 with SMTP id
 98e67ed59e1d1-2ff497c4309mr2030809a91.6.1741178867659; Wed, 05 Mar 2025
 04:47:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250304225245.2033120-1-benno.lossin@proton.me>
 <jpQp16UCJ00pInqOI-QFULU6-FKl2bBtAlmnxtXWLgXPVb7gy6d727nr7THeyks3ERF5Yqu3R6bikD0OK4mqXA==@protonmail.internalid>
 <20250304225245.2033120-15-benno.lossin@proton.me> <87h647d6xg.fsf@kernel.org>
In-Reply-To: <87h647d6xg.fsf@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 5 Mar 2025 13:47:35 +0100
X-Gm-Features: AQ5f1JrgLZHECIWbeIOwHVWTYGSTQpRk2veZ6sZwRLC6m5QNriP5yQ5LLd3onWQ
Message-ID: <CANiq72mrxwuRJDQ4D0v4-LpdokDt4eLjfQu_QjvE9s0uBjegiA@mail.gmail.com>
Subject: Re: [PATCH 14/22] rust: add pin-init crate build infrastructure
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Benno Lossin <benno.lossin@proton.me>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 5, 2025 at 12:59=E2=80=AFPM Andreas Hindborg <a.hindborg@kernel=
.org> wrote:
>
> If it's not too much hassle, why not add them in the kernel as well? I
> would rather not have to go fetch the user space repo from github, in
> the event that I ever need to patch pin-init.

If you need to patch it, then you should generally do so upstream --
this is supposed to be a vendored/sync'd library.

Cheers,
Miguel

