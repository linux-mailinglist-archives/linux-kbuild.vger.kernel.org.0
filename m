Return-Path: <linux-kbuild+bounces-5305-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 99F03A0006F
	for <lists+linux-kbuild@lfdr.de>; Thu,  2 Jan 2025 22:13:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 424A3162E11
	for <lists+linux-kbuild@lfdr.de>; Thu,  2 Jan 2025 21:13:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EB131B6D0F;
	Thu,  2 Jan 2025 21:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="z8xzJtP/"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 358621A2543
	for <linux-kbuild@vger.kernel.org>; Thu,  2 Jan 2025 21:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735852398; cv=none; b=aTEj9Noa+2YDrpgOcyCh3iDGveJ/Qt4nR/1U/oMV0H6tWz0V5L9sH9F9DpPSaoa8ENe24DPO7LM3nd3vLRDTbdBV+l67HdyaysDJ1L/WX1pKQX38Yd9UvPu7VMHqQ04kl2HTgsfySoqMGx07yv9y4TNNxr9cxpFUFpXgrxAi+FU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735852398; c=relaxed/simple;
	bh=ZCPjk1VSEOoj9qcGvr9INHgp3+iPxgC7iRxlFjdwm1g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ioT2AOzJVsLyYlGWzzYaAL3TOqdkqoGlVuj9/QotkHgn2FLhzrMlRXuyuMDU9swJKwC1r7Yrp9/QZcJ/Cl2B4lYxbdhVFitYTgXCEJFEPtJh4AwqzkNU6sfsQ4R5RYTjVPBZ/Shalw8FdkfOVzUg3yAE9bXYYKSr7WW6Bgj4JYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=z8xzJtP/; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5d3cfdc7e4fso2248a12.0
        for <linux-kbuild@vger.kernel.org>; Thu, 02 Jan 2025 13:13:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1735852395; x=1736457195; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vvUkrZDHA2r06RrENG6eOLFTdRhJU/aQsdXibpnme2U=;
        b=z8xzJtP/CSrxsPg8sKrDrNleaJZFUB6HwJ1tPniAn5Q+gvUQdRc1bzBrWLeCeKgPnO
         9R4Z+og7IAOWPHUBwv0PYWdAJvWIcXlXBna7Y+0GgBIhIkLJ1bQFVmT2U6BVRgL4EBUw
         i8Gb6OBhgeY9VXxo4NuhIdi+SXY/T1g7nH1RQo4jdUQTOBAzUHsywVM+EGho7fg8wuso
         JPe4mcDE9OK2oCqA59ndVX1F32+C4pOETi2jU8jkrvK5MrA4y69SEkNKEiLzmVaPGTe+
         9K181gOy6+e8LQkrTNQ4HvuIaK5s1MbYmm/zQIgPqHJjOmVh+k5bmlMK7Gcay4HzJWMl
         OMdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735852395; x=1736457195;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vvUkrZDHA2r06RrENG6eOLFTdRhJU/aQsdXibpnme2U=;
        b=UkIDS3TI3t9SJRgz4sY5bKnIJr+0mO6GPp/zLTM/LvWmW2pGQ10alHEA9S+C+KWHAK
         fdcSCLFcbHmVhlJDR+ICv8hm9LvmTZV6b3LEu9Sgdo8NcGpdBCILXqLT6X8X+x5DT9/n
         CjOeLVrbJK4lIZIdAXOxuCjW5rQ982/eIVks7IqGnhh/btFAD0+fDxoe9exazYddp6KU
         /mQ4g0CSyu2W929Gl7O0ZOMOIYoTaYU8fvnXL8sOA9pDC0cQXwYNEDc6/vhFPMdFA8aI
         zcg2VpU+IB6y2oUcLaRMIAiVS3lpndvpYzNYNCMHCd+QN7kemdliaUS7Vem2wufw1F3V
         ex0w==
X-Forwarded-Encrypted: i=1; AJvYcCWKJnnTFv9Ot5D1Lkf+fNzja9esQSbO1ervcW5DvSAyyrQXVVOGPIMUhCIYPJTywFYv4Zc4H5wXmAfQUaA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzG/1jexi4bfPX1+rDgjpRsmjGgL/ZjBPW1/FqMz8kFpF2ObLKJ
	E/kt+sVs5cm75NO1irPcum+hk0WPHCpbbUWTfQtIxGv6fHgZ0cVF0rdd6BkHNuDywe7kr5uLzK7
	Qwu/qG8wnZ6UZCQdALkQE2MU46kzJ9pIhrb0t
X-Gm-Gg: ASbGncujpIPtd1dKfql/4Ye35ykafO+9wr4yZRF1K8CR8ZjHWC5MYPn835HyTH06Dyd
	Yl2MP+9vqGYEhPdSDB5lz8aA9olhBpEwkXHoWvTAjQqa9S9EJ83z1omc6NSBKUR0tmw==
X-Google-Smtp-Source: AGHT+IEtlAdtAQF0lMpNHSAEsc7gKMjqxf9IMXqHQKnDEMEIOF1Cil022qn1qEqxWg1zVwXIF3GwRL8uUgt3sTNN0l0=
X-Received: by 2002:a05:6402:538b:b0:5d0:d7ca:7bf4 with SMTP id
 4fb4d7f45d1cf-5d9156e2c80mr22824a12.0.1735852395426; Thu, 02 Jan 2025
 13:13:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241219210736.2990838-20-samitolvanen@google.com>
 <20241219210736.2990838-21-samitolvanen@google.com> <CAK7LNATRGzGjLLcv+aD3KdgkZXzwMsCSud116rzEThNXRQC0rw@mail.gmail.com>
In-Reply-To: <CAK7LNATRGzGjLLcv+aD3KdgkZXzwMsCSud116rzEThNXRQC0rw@mail.gmail.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Thu, 2 Jan 2025 21:12:38 +0000
X-Gm-Features: AbW1kva22k7lR6mC6lLzzh3eFbyjqTfNlFADg35Eb_8EP8gJ3kl6j3JlF1zhr0c
Message-ID: <CABCJKufXd+JZBm6WPZG8e+41DSTVC3-t33CbuOC-L4poTRQfpg@mail.gmail.com>
Subject: Re: [PATCH v7 01/18] tools: Add gendwarfksyms
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Matthew Maurer <mmaurer@google.com>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, 
	Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@samsung.com>, Neal Gompa <neal@gompa.dev>, 
	Hector Martin <marcan@marcan.st>, Janne Grunau <j@jannau.net>, Miroslav Benes <mbenes@suse.cz>, 
	Asahi Linux <asahi@lists.linux.dev>, Sedat Dilek <sedat.dilek@gmail.com>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-modules@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Masahiro,

On Fri, Dec 27, 2024 at 6:02=E2=80=AFAM Masahiro Yamada <masahiroy@kernel.o=
rg> wrote:
>
> On Fri, Dec 20, 2024 at 6:07=E2=80=AFAM Sami Tolvanen <samitolvanen@googl=
e.com> wrote:
>
> > +int main(int argc, char **argv)
> > +{
> > +       unsigned int n;
> > +       int opt;
> > +
> > +       struct option opts[] =3D { { "debug", 0, NULL, 'd' },
>
> You can add "static const" to opts[] here.
>
> I like the array initializer formatted like follows:
>
> static const struct option opts[] =3D {
>         { "debug", 0, NULL, 'd' },
>         { "dump-dies", 0, &dump_dies, 1 },
>         { "help", 0, NULL, 'h' },
>         { 0, 0, NULL, 0 }
> };

Sure, I'll change this.

Sami

