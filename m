Return-Path: <linux-kbuild+bounces-3158-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 921E895BDD2
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Aug 2024 19:58:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 138ACB23C83
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Aug 2024 17:58:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E17F91CFEBC;
	Thu, 22 Aug 2024 17:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="A0TnMeyY"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D8BC1CF286
	for <linux-kbuild@vger.kernel.org>; Thu, 22 Aug 2024 17:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724349483; cv=none; b=ExLFmQTYKEtJx+vYDkYoUpUCNYrkPOOhso7MWw2buRO/lUL/oVWiLKvag2qAzX2pW3zhSojtmuxpzYTZMG3OBIzq9T9sBY5z4e6OXpWszcmaCxlTKn/RCW4UzBXm9wI2zVZ/bi5pGRgA+/muzo8ppC6ST7jPTGKPNuVCTXtUTzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724349483; c=relaxed/simple;
	bh=AyQnYoPe6sf/wSyLAOYvZiLsLlNC/z1c6uDn8wvCjt4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PtjGvAtWnprtAlitjI2MzxJw+B80wtuBeKTHCbLG/kSAtM6PoGeP39AOZyGdIilMzUx9C0oBjC6ys1Ebf615wa7IQDL+D4z5QvNzuLBw8f6n6ZzJH5BOFrFGoXt0mmYzW+oYoBx4r32+VsrT1PSjK6YUlTSEerFZMKeTWgaYIsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=A0TnMeyY; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-44fee2bfd28so27501cf.1
        for <linux-kbuild@vger.kernel.org>; Thu, 22 Aug 2024 10:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1724349479; x=1724954279; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TOajGVKCmpE5kmdw/T7Qp/wNBvNSdZEW8S+OXk3bvwo=;
        b=A0TnMeyYdHzSVj/b2HPYdhkBusch8SVI34fBwCpGSZbzyKirr+eshjNsd/eyeq1DmH
         oEr82q5XOSGB1/Nx1BGV2zQLPQlIgtgpFR1pZc/iXchTci7b68j1vVkIGq1uzemWAQw7
         hekHQKnm1CFInFEdfnZ5IOA/Z+sChhxSlyDv5rT/jTdD8P+xRkRAlrAlRJwEa2FFSirN
         vHVDlAcwUKdM3bd3GXaNoSv1CHgBKVmFyLN2QsL7RX7KF1f2EBLwd0bh8hMWDwuK3UUP
         xR3QqYAs+OYTHkxpYBIniCYr0vKfRzi3DFiIBdFhkOnhrr2vDJKE9fFiYcdeIBUaUajI
         nnzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724349479; x=1724954279;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TOajGVKCmpE5kmdw/T7Qp/wNBvNSdZEW8S+OXk3bvwo=;
        b=alW+eMNbvkqYPt+Buc074HgxEn0c2wrvzP7IZJc7pY5ispZPC9HqEx1dPtE0S4b8fy
         70ujKlHnoW9mof2bHQCyaOa8Hfdw5HPlZsREb27AT3fTr0MJgRCz3j9x7iVhoeyKtO/p
         8MWptMqrKvdwIihaQopqAYaon4tYlDweIWv4Nfw3+q3NNDH/bOyea89oHt36IW1rG3oE
         XEL1CF+f+R6gLfDmrESlMTBTNf8a6vgAShpNqTWvAUzB6mW4pkqxnFakeBD/5ZYAsg2g
         rKc4O9QXoZSyzmoBUWkzbOMhbO38Fj8asKSDeaa0aryvbbAN0x8Hdguvo6ki3dE7xv35
         bNcg==
X-Forwarded-Encrypted: i=1; AJvYcCWWBoLUU0vQ+ESQYjzY1rX2bJQRYwcU8JieK7BY4fbcKki2fNzmDTXaiQoKDMMXv9CfEamtY3ARaEg8aW4=@vger.kernel.org
X-Gm-Message-State: AOJu0YycH0b5VvDPNEvr/izmWDwujs7sLRu6EGylmqPaZohDoAKWVsGV
	tcKKs16ZVojBzBhguf8/9ZrQXfYO+2MGSlXMQg6DF8WAgpZ+b8nUcdHayNZyeQtgZ7yf0B3lwIj
	Zc0LRhAlCnMHbH6AXK+ORCXLa2MP5TpiaRGJ6
X-Google-Smtp-Source: AGHT+IHpOQGA1+Xvu8VfAIHeP2jPYfCEPVVyYq8ryHdwZRdhtAaz9lpYz6WE5A47PoBLoqFMm3zfFnuZRf1AcYxhCf8=
X-Received: by 2002:a05:622a:1b91:b0:447:e3e3:77c1 with SMTP id
 d75a77b69052e-4550859549emr27021cf.29.1724349479217; Thu, 22 Aug 2024
 10:57:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240815173903.4172139-21-samitolvanen@google.com> <874j7ccxtz.fsf@trenco.lwn.net>
In-Reply-To: <874j7ccxtz.fsf@trenco.lwn.net>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Thu, 22 Aug 2024 10:57:21 -0700
Message-ID: <CABCJKud=YO=fxF_tmX1N2ec66Rzqh8RsaQu0qrbC5WB529wgWg@mail.gmail.com>
Subject: Re: [PATCH v2 00/19] Implement DWARF modversions
To: Jonathan Corbet <corbet@lwn.net>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Matthew Maurer <mmaurer@google.com>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>, Petr Pavlu <petr.pavlu@suse.com>, 
	Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>, Janne Grunau <j@jannau.net>, 
	Asahi Linux <asahi@lists.linux.dev>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jon,

On Thu, Aug 22, 2024 at 9:43=E2=80=AFAM Jonathan Corbet <corbet@lwn.net> wr=
ote:
>
> Sami Tolvanen <samitolvanen@google.com> writes:
>
> > The first 16 patches of this series add a small tool for computing
> > symbol versions from DWARF, called gendwarfksyms. When passed a
> > list of exported symbols and an object file, the tool generates
> > an expanded type string for each symbol, and computes symbol CRCs
> > similarly to genksyms.
>
> Potentially silly question but: how similarly?  Specifically, do the two
> tools generate the same CRCs for the same symbols?  It seems that might
> be important for users transitioning to the new DWARF world order.

Reconstructing the source-based type strings genksyms uses from DWARF
wouldn't really be feasible, so the CRCs will be different. The
similar part is just that we build a human-readable string from the
debugging information and compute a CRC from it. If anyone is
interested in switching to gendwarfksyms, they'll have to rebuild all
their modules too.

Sami

