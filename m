Return-Path: <linux-kbuild+bounces-6270-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E6EBA6B193
	for <lists+linux-kbuild@lfdr.de>; Fri, 21 Mar 2025 00:24:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6F34A4865A3
	for <lists+linux-kbuild@lfdr.de>; Thu, 20 Mar 2025 23:24:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E50C022A7EA;
	Thu, 20 Mar 2025 23:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fRwV9ZeF"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74D731F5F6;
	Thu, 20 Mar 2025 23:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742513046; cv=none; b=mi3JtaTxLmupmXWz1GIC8mH1K16Dfs2IFiloP7V6jgHSZMPrfZY50qet5W0bnqJt9LcscyUnEPGJK5Pcc/Cgk6Su7xdK07k/pqaNpWFWfnTlTVIsENPgGINkQK4sbrW2eX28+mSlNIVOyYGXRm34hnHHHc7tBF+yfvtdy10HQ6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742513046; c=relaxed/simple;
	bh=W8uyn4r11WjWx6rPaEdn+7zFfeY+5yijNLO6XpQjZV0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dpqhq5HwFVdxY53l5ubJZRVwBhCwh0UDnXTg9z8jQ61q2HetpQLdb0d4kpAkfPyj/MJVcrC5m88nn0pDMYH4LvcPjB/1IoDiS71MMg79kcuvHpq3vrE3REoUOXIcLlU5OYZdO71bP6/lDMtw+/6llajBsJ83WYoBQyGrTKHsvnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fRwV9ZeF; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-22400301e40so2933585ad.1;
        Thu, 20 Mar 2025 16:24:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742513045; x=1743117845; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=78UJncGiTadhrD6Xoh05yr4EEiB6STPqGdF7/vPmhI4=;
        b=fRwV9ZeFFJ1wYX8snSEo9Mr/tBYadfxxww1e1utZ6dJ2DaXZu+RcAfOzojukJ9e4Xo
         hSskOQTgIlOFmfH2OZFGKcKLbcWM2ZYFH1Ks0mrQavj4DKR/vab5/QTS7qWK1jquXtpO
         HgrhYWl2ss1LwMzYhYgzYYg+VtGdpvRQqO3kVSQaG4FPBuq2pk9KkYtAyqiti5tziIxf
         MiaP44FvARfWU1xURrGE/Aj9CI3G6sq0HSNlRp75jvLCLYArTBTPk8iXxUVvD4ARMtyn
         xMKEiPj/0U19nlRfhd0BZKwnc5vzJXHN0DMi7LCJzbufiBnrxqX392360TTzxqj8N2Gp
         GdUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742513045; x=1743117845;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=78UJncGiTadhrD6Xoh05yr4EEiB6STPqGdF7/vPmhI4=;
        b=Zmok8Sn+emwEJso3m329sYjodO1eUbjdLsW6ly8u+9t5ZIZoGdAvspzVLzgbORLLZI
         09uQbfDeRgStNfR3G6M7c08HkNoMxeNMX3/GjwiuTkddVRQcgI7tuWaSGxQtK2Xffnqt
         lo2sAOVoj9hdSYIGCle4zt1bu1rhWO66UJhdYXX2yZKdBj+nEBM6uFN5qEHya0ZcPvgi
         eyke5o3ZlFCUEhf/2MRkFPw3zP2HOONcV0fQ8SlsaQiufiPVKC2tZS6cupEsuBMmZsJk
         PFePT2hpZzQf49bdFfGJFQwlKCG5cwI9cR7XY9rossU0WE9UfrSVJW+KFl2EUFNz58qE
         VP9A==
X-Forwarded-Encrypted: i=1; AJvYcCUBFjWPhPb69GfLkB676I2hoySz0M1i7u7bLip0PIcfVnYc7TyIHHF5Zz4J5vGtqwnuRrVMELHVY1mVfK2JkMU=@vger.kernel.org, AJvYcCUxvnQOWHd3Z1KENhU3ylIrx2m3nxazZBV29dYv0tijtNd0iaY9qRieAryXb9nMuj0H7wXXTpyXGU1yPR5I@vger.kernel.org, AJvYcCWAgsMfx6wtVPU6TvlcyX/2B0cf/GjULlnlA6NwLfKTpnHaQ3nAAtyPRLvxPMVmIgnuSDufsX9WZ90PTQZAWg==@vger.kernel.org, AJvYcCWjFKE4IqVoBs9r2BEHxwaaAm0aSYJHpaYBGTr6vQnv1amvV7DmlF9MIJPcceZcpPNjf7ruvwJZwCF3FFQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYA7lYx1yXH988p8XRCPJ9eINc5RRIRgWzw64W66MPb/DMVQCF
	QSw/9qRdnDDktQifglN0F3PNGTlC7udSplq5K5QF0N1q+OlrSqCZlFAOfQLB43sdFW+kjn2tqqO
	9pTCf7EFDMMYMuq69BBFojxtppUI=
X-Gm-Gg: ASbGncvJ4tAJ26kKVCkgEpcG3kljeoq7TvOJmSpJiaWwQk5Qf7LLWMPS7yX8j8j2TSh
	NWISG1APXVWKu0Kj90w1E74vDrEMFC9m07cZuPJLrtDJM7qqQg159h7ew5/btl17sXibN0y6y1D
	arfAl/YHL1lVjhrfdMwXCqsfR/xQ==
X-Google-Smtp-Source: AGHT+IGWcw7ORKtOYVJClKluL8nolATENO4O9yVP8mhgL3334V4Sm9uTXwtZCL5NZynw5a04Z6B31v2ztFvhC4kR5eA=
X-Received: by 2002:a17:902:fc48:b0:21f:1365:8bcf with SMTP id
 d9443c01a7336-22780de63a0mr8497675ad.10.1742513044776; Thu, 20 Mar 2025
 16:24:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250227-module-params-v3-v8-0-ceeee85d9347@kernel.org>
In-Reply-To: <20250227-module-params-v3-v8-0-ceeee85d9347@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 21 Mar 2025 00:23:50 +0100
X-Gm-Features: AQ5f1Jq6P6370em5rW3xTAKNPORSy5LT2z6OT2b1hTDzjQB4Ly6uKjhiWGGrWlM
Message-ID: <CANiq72mQe-WBmFRNaLT=yCHb2x2Uyi7MsxThCs9S6Vmp6yVSpw@mail.gmail.com>
Subject: Re: [PATCH v8 0/7] rust: extend `module!` macro with integer
 parameter support
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Alice Ryhl <aliceryhl@google.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Luis Chamberlain <mcgrof@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Adam Bratschi-Kaye <ark.email@gmail.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	Petr Pavlu <petr.pavlu@suse.com>, Sami Tolvanen <samitolvanen@google.com>, 
	Daniel Gomez <da.gomez@samsung.com>, Simona Vetter <simona.vetter@ffwll.ch>, 
	Greg KH <gregkh@linuxfoundation.org>, Fiona Behrens <me@kloenk.dev>, 
	Daniel Almeida <daniel.almeida@collabora.com>, linux-modules@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 27, 2025 at 3:39=E2=80=AFPM Andreas Hindborg <a.hindborg@kernel=
.org> wrote:
>
> Extend the `module!` macro with support module parameters. Also add some =
string
> to integer parsing functions and updates `BStr` with a method to strip a =
string
> prefix.
>
> Based on code by Adam Bratschi-Kaye lifted from the original `rust` branc=
h [1].
>
> Link: https://github.com/Rust-for-Linux/linux/tree/bc22545f38d74473cfef3e=
9fd65432733435b79f [1]
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>

Applied (1-4) to `rust-next` -- thanks everyone!

    [ Pluralized section name. Hid `use`. - Miguel ]

For the moment, I skipped 5 due to the UB I found.

Cheers,
Miguel

