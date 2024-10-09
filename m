Return-Path: <linux-kbuild+bounces-4005-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0199A996B6C
	for <lists+linux-kbuild@lfdr.de>; Wed,  9 Oct 2024 15:13:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 337111C22E88
	for <lists+linux-kbuild@lfdr.de>; Wed,  9 Oct 2024 13:13:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A4FF192B70;
	Wed,  9 Oct 2024 13:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WsxU/wJb"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 701F822EEF;
	Wed,  9 Oct 2024 13:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728479590; cv=none; b=I0yA1i1cznHS8vfJotowsL7YwyFo7fQK8cKxL7o7Ese/UMyUN+9/CKD8SZYop1ZexPMzdPpHWAsnPSgBPL8pf206ZdqEH7Qk78cs9ymELbLUz8OT98UsGwDQbgimLDRdwNja9aZJ5S8k7TVG7aANUnlMO7J7R/aXm5K9m6/vo5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728479590; c=relaxed/simple;
	bh=4cRoisIyVrZ2MHSUfv568F/QzLxFhjn90RTnJkA4uis=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rzWp3qt3/Q1T0WpiurJdCtEx4OACKILLjkMjwGhYytMSCjW3lsuEWIpBI4YcSu87nPsN675sUAe9OmIGJ5vz5JabjBM7T2p0oc/AHrju4EjfMGu90kENXt/9ZIsfZ3lD8Wu6Wc3JxDePArausAaXOkGWCbBC9Q+Q/eC+adKHrZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WsxU/wJb; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5398aeceb51so887709e87.0;
        Wed, 09 Oct 2024 06:13:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728479586; x=1729084386; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4cRoisIyVrZ2MHSUfv568F/QzLxFhjn90RTnJkA4uis=;
        b=WsxU/wJbTueO0j2O29eD4Q/EgOZujHL/8v4Av14Afawni10VADlb5MlH3gqTM8cotI
         urbtLtE4JItDpbfRan+LS2U7CjiMUOB3oZ5DjziWhAFkJjiRjHscyWPn8tcYTXYFi6Qi
         b97oLz1GghlgvyF/sNU+1zNkyt5deqrRrI/TQzibFAmxGDBeXs7Hey/VP+RGzbGc8aPz
         bymaHKGvLd5yCSYr+2jCZpr84ckruayBgC3NUa6dNf9oPpukEfdbT5J16bK2eK7iK1E4
         X08LEE82KkqSr/gbihavK7TrIPAOpPF9RlzNm0G5Wi17SLZJSE8UNbhIAKElJBoszeAz
         0jTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728479586; x=1729084386;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4cRoisIyVrZ2MHSUfv568F/QzLxFhjn90RTnJkA4uis=;
        b=PLCM+upRDN4WunrGXVVMYGqxUZlL7vbWyW7vkR/lOYVDC0go4TfcQ2Ik6BuuJJolCo
         alvVIWgb+EEUiJ1YPKptjebcjw3RAUwdIgxhF+jXoVDNyaNnjH0jPrAmSUMR924r+57y
         19dNfNPPqSFnndaTRfgZbufvqsI/yu1nwYmlrmhsDR+VGDHdy0x9Q7WVyMFKy46DV0Dy
         VseI+MPsMxUuxGBYzKMhGQwGJoQ2sRx99SK3vi5uQS2E6vbS65oS0g3ivP+d2Ia6QjNZ
         K2F6Ahc6KpaN2ZwTjSieznEua/Jc5RbtIMhxc8N6YSLLx1d46MkmCgIuit7Ity21J7u5
         lwSw==
X-Forwarded-Encrypted: i=1; AJvYcCVu2Sj5/OEBHTYvvv07wTR7SU9XaFNF8iBAQTCVwGW7Mey9q6/GA260W42s8XvR3hUxpXVS9X9JbylcQNU=@vger.kernel.org, AJvYcCW5K0nrPHoHbxlCciyPSu6dj07KYzQHVvIWUFAV17KL/NK1IBBtJjbsEnLkuFiI0EUv3DQv8q0YMOTHeiCw@vger.kernel.org
X-Gm-Message-State: AOJu0YwgkrweA/w2jmaVmIEf/a8y27K5tkd6rGQ+eHPM0nOlkw3Wy3Px
	70FwMXqmSu1GEhJGdFwW2ini7sBwK3hoO+0DjYbqLoj8Je+nro2ZkwsCqx+6/WmQdhyDA0biZRO
	n/fSsOJDvlKTwsDhaJNOyb9CmWSw=
X-Google-Smtp-Source: AGHT+IE008zqomblx1tJrrszM+uNlZJGNq7JCKnKppDpabWxQe7qoZuglI68UUMUIG1A+M0SfS7epZUJZfYeDpUQU4E=
X-Received: by 2002:a05:6512:3c99:b0:52c:def2:d8af with SMTP id
 2adb3069b0e04-539c48bf093mr397086e87.4.1728479586145; Wed, 09 Oct 2024
 06:13:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241008224810.84024-1-tamird@gmail.com> <CANiq72=QimAkV0_n2nDiPSXT0N3sWxVeapze9FPPhirmoagbug@mail.gmail.com>
 <CAJ-ks9=sxVfjmbE+MuZg=7atpKFj-LJ4i7pk1ex+ZfvrUnvKqQ@mail.gmail.com>
In-Reply-To: <CAJ-ks9=sxVfjmbE+MuZg=7atpKFj-LJ4i7pk1ex+ZfvrUnvKqQ@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 9 Oct 2024 15:12:51 +0200
Message-ID: <CANiq72=geQY8f1J4rEfb-2UP+MOTY031tc=t1wuPNTVzS6tiSQ@mail.gmail.com>
Subject: Re: [PATCH] rust: query the compiler for dylib path
To: Tamir Duberstein <tamird@gmail.com>
Cc: rust-for-linux@vger.kernel.org, Daniel Gomez <da.gomez@samsung.com>, 
	Fiona Behrens <me@kloenk.dev>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	"David S. Miller" <davem@davemloft.net>, Kris Van Hees <kris.van.hees@oracle.com>, 
	=?UTF-8?B?w43DsWlnbyBIdWd1ZXQ=?= <ihuguet@redhat.com>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
	Vegard Nossum <vegard.nossum@oracle.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 9, 2024 at 2:57=E2=80=AFPM Tamir Duberstein <tamird@gmail.com> =
wrote:
>
> What would you have me link to? With this patch applied and using

I was thinking perhaps the series from Daniel, if that is the latest
discussion (?), i.e. I would like to understand what is the policy
around changes like this, what happens if it breaks, etc.

> https://github.com/bee-headers/homebrew-bee-headers I was able to build a=
 kernel
> on my apple silicon mac. Relevant config:

That is great.

Thanks!

Cheers,
Miguel

