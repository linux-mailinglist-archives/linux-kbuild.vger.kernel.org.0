Return-Path: <linux-kbuild+bounces-7385-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 536EEAD0460
	for <lists+linux-kbuild@lfdr.de>; Fri,  6 Jun 2025 17:01:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1763D1651F1
	for <lists+linux-kbuild@lfdr.de>; Fri,  6 Jun 2025 15:01:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C77EB8C11;
	Fri,  6 Jun 2025 15:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iyM1GQb4"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DEB18460
	for <linux-kbuild@vger.kernel.org>; Fri,  6 Jun 2025 15:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749222076; cv=none; b=V9v4T/KyPcKYzHxBJFTmVBcdT/r9zbg80dm3X+/FuKSPglThpPoPlw7APvOdfTJyC7Xv6NkbGXVVFY1oViUQOxZvvGQLxW7I/BSoY3la6Mw/FCUl+LJ6yrpWbuASKXBZydVuIq2ABkp3CMO0g7Hw59JraHmp3gJlUOecO4HCnXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749222076; c=relaxed/simple;
	bh=b8fZI/p5cF6b8d5Bk6U3TNLy1IODz751Alv5CtnWLRM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jOT8oWRVu3FneYuz0WlNrnYDWjmJsyoefehfGGMhMArEZ5Oo9NK1Kr/JLZ2ItnjHuWd/nRQFL2KdzMosK/sx5eBQfMKgQR+gApB64A8Jd+P+u/9AOKNnxSZP6PaZxERwn4gZ9c4rtb4ZAHmRmE5Tbu7dc4b+0ergmt0BYnlzRvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iyM1GQb4; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-23519817b57so2599705ad.3
        for <linux-kbuild@vger.kernel.org>; Fri, 06 Jun 2025 08:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749222074; x=1749826874; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JZ7hX0uxk76AgVVYxd3LS7BMClVtvMDK5NDnflpXUis=;
        b=iyM1GQb4RSO0RXVBekKWHoQbotjYZik+x5bOlJntyG390j2PeMN8puLyW1cFzszZfC
         ngvD97OgsGecx4uwVIX2R9y8abeEfsihcP8zQXuN8xFQzSa62Tys8zLAM052xeNOSW9/
         2OJdClFNlWzkHw+uvVFmzGsjsLpMwIqg5W7nhJhF7bmdJQ3SM+uL3FGlEATpjG+DxoSa
         qo8wTFeWFBQNjQcJ0/kGs5qRHdrFCUv1Pt1Q2YgYzTot1GyZYRpyAMLXgHy62DUoxzXQ
         Cwcbvl+C3pDMGw+XsOVw/dX9xv2DyI/eAdVtyma0vpwHzGZgvShUG4E9+StFDORJPJDf
         Iaaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749222074; x=1749826874;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JZ7hX0uxk76AgVVYxd3LS7BMClVtvMDK5NDnflpXUis=;
        b=fg9eP60fx6Q2M1SIKL1jW5tlNJtu0rUD06dIMnpfguZOiodbp4DFk5Z2IOFuspWzrd
         a9K5FagKm4gYkhQ3VRFjQHNA6Ha00lFV3HuH78ueaJhSfa04rHsacriyfvfwXepiCG3D
         mxTQmvf5PltANeL79tqWskTUcTRg7kVENJPt3M6nEqnuHzkT7DOMUrWLdyENzFrKc98f
         1i9yz5AkwOVXlNlzeau+qdaAE1NqeSydaV0Ge2yLAw3Bx317GLAeTIoa5y5DivNmj1ig
         sIDqcsjnlN2tveYsilFe1j8NhPNVsE4YKcfOyaN6u/kWf99JeBlJbUWJpd84nCMaDmH9
         GaJQ==
X-Forwarded-Encrypted: i=1; AJvYcCVedac79XFonPejQhS7dfqHZPhQ3jiKWB1hADKrVE5N1GeXlO51ODJp2E/yrWATLahjpYi/zfuOvBRu5Kg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyEHtzX243BPQNCBmeuP/HtCHRw5WuT2zi/J7f4whktYjMCOMXy
	VpS0K2LVeObXq9GEYdQGQwlUHyaWrSsbpQ9Mt8VtwwSHYN0vNIzRleUr2YsDagFQMPKBlk2zypK
	UkxW0HyW6TnyAGPZOG63c8DJjznO4+g+J+1pT
X-Gm-Gg: ASbGnctJTbaGU6LOb0mcD23NZuk90kxOZxfNqZjHtE7qr648kZicbLgohPNtSzBDbZO
	4DhO9A5LhjBIbuKhQslhOwh1GExCiqdebFEd2mxLvFlreJUOfYC/TaCVLyvxLOuXWjWzS8vBofY
	0mVMFV3e8ZsSRgJYSwtRhv9tYxUqQHBMe9
X-Google-Smtp-Source: AGHT+IFBy6RJ9Z5laY4La282j7lSl34eVskp6Uwbww1S2NPsiySiAKOZ0U6r36MNE8LyJJIBmRaGZu7C6avfNY6ws8I=
X-Received: by 2002:a17:903:1cb:b0:235:225d:308f with SMTP id
 d9443c01a7336-23604025e72mr14741995ad.4.1749222072622; Fri, 06 Jun 2025
 08:01:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250604183539.425053-1-martellif67@gmail.com>
 <CANiq72m48ixGdMSpr7bWVBBn3ckHmj4pfy9GU0ndVefYXQEzSA@mail.gmail.com> <05174d44-ce14-4577-bece-723661100810@gmail.com>
In-Reply-To: <05174d44-ce14-4577-bece-723661100810@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 6 Jun 2025 17:01:00 +0200
X-Gm-Features: AX0GCFtwHCbnG96zWzua5ecJv-nqmZQA3qXAuyirdObivS-esOxU2VAfJWNKiDw
Message-ID: <CANiq72nNNzXQSMYKee0sAZZFB1k9sQ=XFeA8nUp_piO-2zedGA@mail.gmail.com>
Subject: Re: [PATCH v2] Kconfig: Added compare capabilities for mconf Ver. 2
To: Franco Martelli <martellif67@gmail.com>
Cc: masahiroy@kernel.org, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 5, 2025 at 9:33=E2=80=AFPM Franco Martelli <martellif67@gmail.c=
om> wrote:
>
> The commit message is the subject of the email, I used git to send the
> email, this is the command:

I am not sure what you mean, but empty commits are generally not
allowed, and Git commands will send the commit message that a commit
has.

> This is a pain for me, English isn't my native language so I'm not
> fluent with it :( sure that the patch can't be accepted?

It is up to the maintainers, but please see:

    https://docs.kernel.org/process/submitting-patches.html#describe-your-c=
hanges

> Does the attachment file satisfy your requirement?

I would suggest avoiding attachments, especially compressed ones.
Instead, I would suggest waiting for some more feedback and then
sending a new version.

> Thank you very much for your feedback (and patience) :)

You're welcome!

Cheers,
Miguel

