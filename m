Return-Path: <linux-kbuild+bounces-7180-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A2F27ABE39B
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 May 2025 21:24:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E8D148A6BCB
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 May 2025 19:23:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9200327815B;
	Tue, 20 May 2025 19:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pr3EAfpi"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDD0C2620E5;
	Tue, 20 May 2025 19:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747769046; cv=none; b=Gh0sOderWc2GYafJpI9w6qCzvC+s3Zpjm7DP0sF4W013sR7qELhIiGVqBZsryhNH77tSPHFEt+siWMJriFwUw3lfVQ0key1D4JOmAImVgwhIiYiBvpSP9aNUksQGrmtCEQ8WEKZ5p7lBiTdaT1A3W/hp5fiN+THbmOzl5qqEGxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747769046; c=relaxed/simple;
	bh=L1J2+f/o6ewoklc+hKFnSACjTFC2/ANmUYvlgy5NJjg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ep55eN6lYHUr8OkrANfiYLroZCltICU3R0ChsP8HAi8l5suLUkcJfgAYnKrfoRgC7tivS/3v5+7Bog6Xr/VtIB0LHl2NLpNV1OdHpot58mPnLy5rDAWyn5I9uJlA5qFnttCcFswAFCDbChdd2HsSzcg9/z9hbec7q87i8CqTuiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pr3EAfpi; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-551fb4d153dso1678605e87.3;
        Tue, 20 May 2025 12:24:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747769043; x=1748373843; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d6XdgS84YDQPuRuy9Jq0oBvxTqOH5n4daq0yM54SeO0=;
        b=Pr3EAfpi8tHBNGmpt/zsfP4Jp/nLFdeUgN+g7T24egdkp4CG0/NAMvD+tLnA2pcHR2
         ad0iyLoSCZGNOzJ7dEZ4C+bbJNav9SadzBev6kWVzmS/VqTivtBRG9OC1KmM6Ub64iyR
         ySp45jhrfiK1C2YXV+Qi6J/I7YJNoQTWW3icYKYtmNdEcq/NZQxlqE46Va6ibZF0gFa3
         dnfFfq5tLEm7VQgV1v5J9x6wu1FejEWL+h29wrBLuqqLRRFMFsre/nYMttST5i1bXKoR
         CwjeO65JEEDUk1ocjRlDR/PZfU3KjMuesoRdpLW7At6/LbpU7T3bIfe+dttSISIr0ukE
         LIpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747769043; x=1748373843;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d6XdgS84YDQPuRuy9Jq0oBvxTqOH5n4daq0yM54SeO0=;
        b=EbBKZNenOFt8Q5AEFBWVYR4s8YglwXRiBs6lg0Cpt993MZ1swP64PkSDLkoWcBXbzQ
         PeSZsG089MTeFArS6OJd6J7tioHmEC/xDVnaADAEScdS+BLy6Cg+96dE/ce1VDWnwJX6
         VqDP0xh59Fzx992/lgNb9u2W7neb7HpoLMM9CtKJmhX8B5o7S32iiuZye4EAHd1PMuBU
         z4JZGyjcIuudixJ76udNFMSIVuMDeWUeXdHp8cxJ/JLziIEl3occzwolulQVEyDXT6rS
         VfFRGsESto3e9lBSiDkfmE6lcL7F3Gt5SWpKmVs6GphYvXhpp4LxXR5141MGUzOk4HxD
         jFGg==
X-Forwarded-Encrypted: i=1; AJvYcCU1C0Gs8JhbfFlCJBEWbtVhDChxyGV6lvP7XAHdTjW+qGar7R/qobw3ln7yrUy2APlF7+tIzpkYonEUUJE=@vger.kernel.org, AJvYcCWBKHo1usWL3S7OsR6vseNiQGmWW7eEk4pdoj8UQOng7FfT2a71eHlxwX7QXA70lORzwOLx0u/iBpjpVs5bMFQ=@vger.kernel.org, AJvYcCWyBUa88Nz6cJKfX8jvKtvWQJqIixRf2O3Yt0JDQNlMIC+p36Coyc4wbDgv1ndaNOtqaubXBFId@vger.kernel.org, AJvYcCXXZ5CVcuq46OXCbsCVqe05IavjWjsxw2b2CEHn0H5nWbKAxYMWwSIEut9SI+20HZnbVk64jVLVCvdhmO7W@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9y0OW+DJdNXobUup0LLDal2yE6kks2iNtJHts1qwUiqn7vOTA
	NgfZqRFGtfGKjuho9NgKjtYskscwLCcpuPfMrIc2J87N/D0mOIC5ArsX4NRW6IYtbUSAyvUlaM/
	mCFeicwJMs2tkkybGqiaPdM+VpzR/uL4=
X-Gm-Gg: ASbGncupfMLgjLO34ARpfAzXR70aFbI8HKE29KACRKvQEUzttqDFSySRQl5el4tSi2L
	KGdX589Y9NxieYROntirT8dms4ELJ9Db8N5d+anEH+ZxR9lxDi+38Chaktvwl/SFqq6XY1CN/ne
	ZI8iT5iQ8geqsn87U437s64hiImb7Kw7AdBcBw1rmNLJ70YiM8HGDova03ShjMEMObl9NM+xMCI
	Ee4
X-Google-Smtp-Source: AGHT+IFz3JlmJoyJ1wap0ojoWn4Wrko8mlIC7Ep/pg5OlmQk3tTzNnmLB3I17P8W6HKbwMRLn0gUghgOlCmTVzkS+jg=
X-Received: by 2002:a05:6512:3e17:b0:54d:6dd3:614f with SMTP id
 2adb3069b0e04-550e97cbca5mr5277052e87.21.1747769042589; Tue, 20 May 2025
 12:24:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250520192034.889415-1-ojeda@kernel.org>
In-Reply-To: <20250520192034.889415-1-ojeda@kernel.org>
From: Tamir Duberstein <tamird@gmail.com>
Date: Tue, 20 May 2025 15:23:26 -0400
X-Gm-Features: AX0GCFuaLSbZQ1hVvU1lb2VxUKLxVWKNlDMNxG3qmRXP7Db0x4G0ZVJV-F0CVHo
Message-ID: <CAJ-ks9=4DJdbUBiy_45wWPviOs48NEK1DmeqWnDaFSpkoda_GQ@mail.gmail.com>
Subject: Re: [PATCH] rust: kbuild: rebuild if `.clippy.toml` changes
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 20, 2025 at 3:20=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> We rarely modify `.clippy.toml`, but currently we do not rebuild if that
> happens, thus it is easy to miss possible changes in lints.
>
> Thus rebuild in case of changes.
>
> Cc: stable@vger.kernel.org
> Reported-by: Tamir Duberstein <tamird@gmail.com>
> Closes: https://github.com/Rust-for-Linux/linux/issues/1151
> Fixes: 7d56786edcbd ("rust: introduce `.clippy.toml`")
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> ---
>  rust/Makefile | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)

It is possible to do this only if CLIPPY=3D1?

