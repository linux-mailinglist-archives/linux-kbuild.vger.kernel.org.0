Return-Path: <linux-kbuild+bounces-7080-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C630AB2B43
	for <lists+linux-kbuild@lfdr.de>; Sun, 11 May 2025 23:07:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A83EB1897AAC
	for <lists+linux-kbuild@lfdr.de>; Sun, 11 May 2025 21:07:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04C571A257D;
	Sun, 11 May 2025 21:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZgIiZrEk"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8936342AA4;
	Sun, 11 May 2025 21:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746997645; cv=none; b=hZceABPc9FjKzcNv2es7tZKbdDzqC5UoOgUsfw2hroISoOppa0/zChfqvhMz8K9Bh7o2ADZtqYm1CdDVO3Jy2X9MemohFCGtMG7jwfARN/PMExVhn8OMnAfq3FIR03br2dBy9KnY/YnkwceafmgNNnqhXzG/QqA1Gs9c9RDZOmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746997645; c=relaxed/simple;
	bh=DXOr8azKPEQfA0+v3vyruAT6gQrdg8VlIpS8xAaQW+w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hWZqfnpQoJnAZNUN4CtfdMpQtoSCiLrEPaiMPwJMU8y9Uvxt/7Q3KvghaCTzSfzuEj4M6bdaDnRZHhWKvmSCr1z/3aFxk0cDu8mKVQA27ID6n9Q8MvSmqKGD4zaHu7uWujBLADM87Lhl5MxymwPIUxr3RVNfAuY9TbEixa35LEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZgIiZrEk; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-309e54e469cso675533a91.1;
        Sun, 11 May 2025 14:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746997644; x=1747602444; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DXOr8azKPEQfA0+v3vyruAT6gQrdg8VlIpS8xAaQW+w=;
        b=ZgIiZrEk2euVbpujG7Pe1EBOBgJxFEDpRHauUFCrelaKFOaAw2s5z6YZlR2CJVzNw0
         3WeSt4umoIxDXbjL5b+YhLWrXOYKthfUeSyMc4Gb5GcmYULLdpqRDZbD9PvU/nmHVo31
         vv9nxztriXD21a1MD9pQ7yYGC2FaBplJVgN8r8Kb02PD0710KOEibWWOy10DHlXK1Q3c
         LE71PBn1+7QEWorNiyrNUjD1oMn037u1ptD+uqBABtMcLirCcILICrZpvhTHRW1+8duN
         e3pkNEWIK/qOZI0SduKIeQyHlvMpNO+LBUkl74OMvds5m+w0YRFRmpZcD51I0AR1vhVr
         Lq5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746997644; x=1747602444;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DXOr8azKPEQfA0+v3vyruAT6gQrdg8VlIpS8xAaQW+w=;
        b=pLaSbmdvJ0eCqGsDgFmLkQEY+omX1uzNOFOlw9S/jl6i2ERJsLKalx/Bn1fgHyZN5Q
         /F/38rLn1noE1bo5ShxZBGIZ1bmgwrS3osLAYiXdjoBiKy7kqfGD41jbc4MJrNtHDZhT
         vqYB+jbBcnZPcD85X4JGbBAxdJwAFBCRRPlR6ZJE5MZt/x44NGTaebqzq5y178HGMR5O
         iOi+BjdKLtaiHq/sIUDC8qJsS9kXj1csPFy/PLQWbV6mF7BUDlOOCTNxeGQMC/XhX/BQ
         zT6yJZ9O7s94pw6oqAl8Q4Mr0JV9DjzPgdwSan2xBZKO2lVGlOFrdIok8K3zjm1pbogj
         rzLg==
X-Forwarded-Encrypted: i=1; AJvYcCUiVgSapbD8QlLGQfri5nT/WQtjQwCY7HOM6JhxdX1wbcD0IDCyHwSjDdkJMIh/2MVSy5QIEXm9ymY=@vger.kernel.org, AJvYcCV1rerUWZAKrpIWEqR/ZiST5N/dErHcc7oASBAvIH9LOgJ51S+Hc3FFwvEO1jJpO1lIFDw7wIdc7PCi7ZopdIM=@vger.kernel.org, AJvYcCW85JEK0e7GtKkUdDNJHfbKWI7fnJYUNbh6Pkhq3/X6vxZxHh51p+RsXVh6y9XuqTteig2ndhuKYJOy5JaD@vger.kernel.org, AJvYcCXi9bdwKVtdLNxg2I5JCUo+RhChe9A/AhyXN9qprT5luyyV87XWvbZm4uqstj8YZI8CYVmyyOZlRaGf/edM@vger.kernel.org
X-Gm-Message-State: AOJu0YwHhr60Sb6Rnwq49RPaiN8eVYrIdYFiqmx8B3lF5LonA67Dgw+b
	b3MwJNM8iV+s8io+lTx9ieDY8bh8hEaMO/qMFIE1LMfTPhG8RQ54pDbzWYr2Nn60FqoTMYEAUqz
	KDaEMVSoDz4khdeyXkULLuBWH+4Y=
X-Gm-Gg: ASbGncubRxar7McfafDv5AULghs4DagM3KLTL7/Po3dlfdfT54pHgFPDToJ2ume5xOf
	9itLIEVT7nv8JhgvG2oLBIdh02MiR/1XLWpR3tMplvLuBfFLAzkowIKy9C/rrsbeTS75ZNxErDf
	OTSTAVC3/qfrg9lSgKu30EWUyreoQU6FpO
X-Google-Smtp-Source: AGHT+IHOfWeexnJk8Ca7bBLpdOcTT4LIUmMhpfY5ZTB+wvnXT6EZAH9xZy+kPylcjg5KwkYw2tDcwdaikYzvarSPAhg=
X-Received: by 2002:a17:903:3bae:b0:22e:72fe:5f8c with SMTP id
 d9443c01a7336-22fc91a1e93mr49802155ad.13.1746997643741; Sun, 11 May 2025
 14:07:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250511-kbuild-revert-file-prefix-map-v1-0-9ba640c8411e@weissschuh.net>
 <20250511-kbuild-revert-file-prefix-map-v1-2-9ba640c8411e@weissschuh.net> <CANiq72mrXv8JfsOE3vERAZCVhXs5JPsMRu3jAPPoNzFao2qdjQ@mail.gmail.com>
In-Reply-To: <CANiq72mrXv8JfsOE3vERAZCVhXs5JPsMRu3jAPPoNzFao2qdjQ@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 11 May 2025 23:07:11 +0200
X-Gm-Features: AX0GCFvyjEWABnXQLqIgIgnApF-urYQBkt2BKnPa3VBBUxdjCGeAX14Gn152RYc
Message-ID: <CANiq72mdBq=9Us+e+H75c_ToSJd7h6kqvPeAiaUx3Hj9APLMMg@mail.gmail.com>
Subject: Re: [PATCH 2/2] Revert "kbuild, rust: use -fremap-path-prefix to make
 paths relative"
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas.schier@linux.dev>, Jonathan Corbet <corbet@lwn.net>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Matthieu Baerts <matttbe@kernel.org>, =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 11, 2025 at 10:58=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> Hmm... could you please give a bit of detail on what workflow breaks?
> I quickly tried to open a C and a Rust object file with gdb and it
> seemed fine. I can try later on after some travel.

Ah, I think I may get it now -- do you mean if the debugger is invoked
in a different working directory than the srctree?

Cheers,
Miguel

