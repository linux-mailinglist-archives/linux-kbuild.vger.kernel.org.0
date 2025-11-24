Return-Path: <linux-kbuild+bounces-9826-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id F3B90C825D6
	for <lists+linux-kbuild@lfdr.de>; Mon, 24 Nov 2025 21:00:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 748B0349CBF
	for <lists+linux-kbuild@lfdr.de>; Mon, 24 Nov 2025 20:00:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EC062D2490;
	Mon, 24 Nov 2025 20:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hm8b1of4"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 990622147FB
	for <linux-kbuild@vger.kernel.org>; Mon, 24 Nov 2025 20:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764014434; cv=none; b=JcqAP7roYdH0rBZZbqYRTke8sAeySq2Wq9mMMAlYei0EXC1eqSGX3pS07w1ZuL4g14B5uXr/UrMxV3aD4aOvwOCK528nDukmxdrgPS1NlrbPloMjPfyQE+N38S8lMIll7cmi0Cr+PrzwD2sKYVnJmQzcvBrf0oUHSLDVuck5gKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764014434; c=relaxed/simple;
	bh=Lqzo6KuYQIpSG74Y1hMug1+AjSFkQw8fGrQ/Uz8sHF0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oN1MmApPxA1ZIaq8FZ+8Zw+zpJYOkipHAhXf3V2yzC+13KbCZzRFEyy3MPxdFsXP+OUoVtZYtvBtv//4u4GecoRclcNxnru7EFQtEQDlGESq0DI5ARFhJJbnUzsBN4VKm58flgqvqoLCygRJaAUfpkL+jIl+tln6BGuz8NjvmCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hm8b1of4; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-bda175a2013so241184a12.3
        for <linux-kbuild@vger.kernel.org>; Mon, 24 Nov 2025 12:00:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764014433; x=1764619233; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lqzo6KuYQIpSG74Y1hMug1+AjSFkQw8fGrQ/Uz8sHF0=;
        b=Hm8b1of4wAr/ckcNnC4QPpCfdgdNqitEg6VCQqtvgOF0O5VqYGViHKze96agOOosZN
         KymlxSdd7fjjtrtY7Ep2yTE4xqr5bAiNgft4X3a6VZBkcaD8NLKK2GOkVRLugM61hV8P
         8hQebNi111AHAYQ16zq8gREaRic9e6tNoRf/5/qOBSB1HUTXBExqud/rldkvJFFEYF2I
         EVH5b6Q+wvupRjpsAAUXdKrRTMmcO5UiLYTZnz/iugfhmgpS//9QDe3Vl1wMPMmmPCQN
         U44pUaNTWodEH+rWDbSV8IiY3JUb0duoe/wfU1UqOol84Pyd7AMhCJNVhEeEDFGDIO40
         lGLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764014433; x=1764619233;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Lqzo6KuYQIpSG74Y1hMug1+AjSFkQw8fGrQ/Uz8sHF0=;
        b=NXpt05RdRUtgPmsf1cGGmB6J60ah8ToT15PFxqktdnoAQywOmqE4Sxxk35QzmpdAQm
         k9cT68fD8oZpLfkfgsgzzNP8FRpUVTsQ+Ypwm1WXAnZZ2Lyn0Pon0iJNfm0mt4KO4hx+
         e+Ey78vJyB7XyfOegj5bHAjxHD4jsW6Im8Xp31Nc7U4TuFRMOJpIM7VbPoM/VcI3zoM4
         fXapXP9JzfECx/iOb2EVIAxz+NpS5VSuQAEH3kDfZ/oCKt5kcDo8RnWT1j8pShyUjxNC
         hF8GElraPAnK+z0G1pDUsPfkbeijX+wJto7PuSSuqFqE0qL9gHvxHpvqcRZjItH3LO0X
         wz0A==
X-Forwarded-Encrypted: i=1; AJvYcCWP9WvSXz4MoAoyv6RARNGZJzVzK/1WtgbkmgcFEat3W7v8kJ65irV+bLCyTdEqJKxMqJEm110pzR3yeb0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1S0MafV6PkZWLun8VT/QYjnyGzsY5R8uKZwHQkn+faY8am8IP
	F5+NNmW07Wx6rrFPgFc86F+GvpcLcKzBhMGnJNCxKEHG5AsSh9OuzcW204C5QDX+p997Zsv1AFO
	mNcsISgtnDtBOYSVd+dls9JdXkSpzZyI=
X-Gm-Gg: ASbGnctFcEkJskOcar+fbaNcm0HMautVQhox/I3E34G0adDKM8o7mftwXrwjDNcrzuN
	qrTCZiw/cAG70zoFLIr1gqnhDaQeRL0Hb+WEZK1At6gIYDZ195xS+wX8nNbpWFG1y7GBMU/JfDT
	5QxIgNnikdymyDnWq9jg7GI03lExdPqrPFjVoUPu32gn6PiGrE2NRWITHofvEm/R3sqFATI6d9n
	Qc2YFVFX15yOHmpP6+4url/YIebsEJCILafe/UVEem8JH7flms0rltSA0jjmD9h7ADkk9dUOSc9
	Q5+d/AUtAtyBr/GEhZE7XsH3lrDkUSHFbMwxNWK43gUiBSumwHRqXhSKlgfJ/jcf4zgGlveSJHm
	YEHvMHL1KTvNfdg==
X-Google-Smtp-Source: AGHT+IG4tizPpCrTS+t+qkNKBZLnkOofnp+IcXAXiJUxVZzoCXq66aOaGTcbmuC/WZL2HHhfomtNvIkgZR1CwBs8/oc=
X-Received: by 2002:a05:7301:1906:b0:2a4:3593:5fc9 with SMTP id
 5a478bee46e88-2a7192a30bfmr7648989eec.3.1764014432680; Mon, 24 Nov 2025
 12:00:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251110095025.1475896-1-ojeda@kernel.org> <20251110095025.1475896-10-ojeda@kernel.org>
 <98e549da-b7d5-45bc-8a9c-d05eb06a75e6@nvidia.com> <CANiq72mcQJnW-F+nb=Vseoa_amcwwhkC26N9BOs12MVfMVOdVA@mail.gmail.com>
 <27735776-7538-495c-b4b7-2ae8893d28d6@nvidia.com>
In-Reply-To: <27735776-7538-495c-b4b7-2ae8893d28d6@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 24 Nov 2025 21:00:18 +0100
X-Gm-Features: AWmQ_bm6tYrxXRTZPykfJMBebDHDGbX43F_-36XRzN696OPkPdmldh6vK4MLJ8A
Message-ID: <CANiq72nAJeGZKZUND8Cwmd=V5_rWAmA=KYUD-TZ6auV9qmCtvQ@mail.gmail.com>
Subject: Re: [PATCH 09/18] rust: proc-macro2: enable support in kbuild
To: John Hubbard <jhubbard@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 24, 2025 at 8:37=E2=80=AFPM John Hubbard <jhubbard@nvidia.com> =
wrote:
>
> A minor thing, but, it looks like maybe this was forgotten or
> overlooked in v2?

No, it is there.

Cheers,
Miguel

