Return-Path: <linux-kbuild+bounces-3297-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C630966D2A
	for <lists+linux-kbuild@lfdr.de>; Sat, 31 Aug 2024 02:06:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1F028B223CD
	for <lists+linux-kbuild@lfdr.de>; Sat, 31 Aug 2024 00:06:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65B8F3C30;
	Sat, 31 Aug 2024 00:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3vHhwB/r"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCB08320B
	for <linux-kbuild@vger.kernel.org>; Sat, 31 Aug 2024 00:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725062780; cv=none; b=svSE32ifwqClSnvMGEbwRzPxJzMcpL/aWY2Dv51ofopsfMdWzu+vJVYOJg3TS0RPyfZnBDiZjehVKfMbbTUOM7qwwllytJaMFJWPFLKNwQ5CzWmmIpqH93Sm6vFisv+fJcjpEb562PYARcbfhWMYIep6kHVjiReqetOIh5CzKCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725062780; c=relaxed/simple;
	bh=n8xcqiHEzhMcHy2TGqeuIA4zEqW0LBBlmS3A1RDmuII=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RkDtcqdjFPh16TYhLw7e3eVK9+PTLJxjzh3i4D6gWxW1AbbIn3zDh3R5APWfHfy3YU6kZ/tnXRlM88k33tYs2CJuszW1XG0xUuwozs+bC6JCf7PQzJOZuQSpVaDRgBcB8BiSrwhGtupD1gIUXA4Siwrv0sv0dIDTZMQvGDBScH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3vHhwB/r; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-4567fe32141so79731cf.0
        for <linux-kbuild@vger.kernel.org>; Fri, 30 Aug 2024 17:06:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1725062777; x=1725667577; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n8xcqiHEzhMcHy2TGqeuIA4zEqW0LBBlmS3A1RDmuII=;
        b=3vHhwB/rvceYxkjD9IZz+rYaiCLZQGsFAT0Y6tqw29EeC9vQfiHmHQFKQdH7t0XgyA
         ka93vNsLHaXQYaxHdvxrkoZc9hQz6EJvlHImjserC7JTNY/HSwBkQ66f2WrEH6UYf+dd
         EVNjrTeszz/K9UMyzgHJmzc76dqF3ZI4pxTNadrjBBuZqea0ZuyFlYGWdv+fBr/e0HcS
         Xv4QWl8xUlmRh462iNuLhzepBAgxql7at6Y7M/Vn5K+aVlxmJ3abTsz+q8uStO/IuCpM
         6icFmQQZLLOe84MWI7h4OdH7ppmKfNqb7F0qzIPiz4Z+o0CKR8wdsOZ8T2uBhiK5bXsw
         SxhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725062777; x=1725667577;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n8xcqiHEzhMcHy2TGqeuIA4zEqW0LBBlmS3A1RDmuII=;
        b=gUzM3Sa7xZLQg/u1KBlL9hrbmmqyYbIhpeHNyMNQB2WG3ZJB9NfxvpXZr7ApTbAssX
         Mfk/pt2fH2EA8hDuLIA8RmP2PKTDetbmB+7oP2Ukwbzb5OI9Y6V3lIF2YHBeoQyWkRbn
         CvyV/q3z4fDDIx28OtbD/bDyMPGgV0xarEBNSG7O88seN9l4bNDRcL6l53BYws65fwbe
         TQjziTwntvsUzhoQPq+/dG1k8gEJN4Qs1QE103jP3nCxal6FdV323+61QeiAG3AX2lJv
         +rjrPX+uo5r9IlgP+qUXT64lV3FioClVlfkU87SmFLNau76XfWTEBGvEtxV6cUsurvpo
         KuUw==
X-Forwarded-Encrypted: i=1; AJvYcCXTfHwAgvjxH1WgaQILYY/U8PXvnGLOgltVM6r5hvne5EreLxIee62XujGKGSSyrE819NUOZ6JHLfsn31Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPf/FPcvVW/xddSs7Vw4hyI0zb5wHgfle4l82EB1eR/BOkU0kL
	5ja3LemXCkxZQcpgCUlWBkRDopSnw9AY9HCJn39VESM3eycnPDlkmSW4WjHSKCyQOTbdHiaQHrZ
	cAJLeq+drAuWjLGDKZvz7EAxT7O0JimIeAATU
X-Google-Smtp-Source: AGHT+IFg6NnIqNYSyCQdp+4piRmBL+jQdTn0fkJWHCEEU/fYsuOdUxONjCSJBEQ2wyGjIkWsARNyrhv7f4RZhj+2hRc=
X-Received: by 2002:ac8:5987:0:b0:447:e847:486 with SMTP id
 d75a77b69052e-457c41b4ae7mr670401cf.3.1725062777214; Fri, 30 Aug 2024
 17:06:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240815173903.4172139-21-samitolvanen@google.com>
 <20240815173903.4172139-37-samitolvanen@google.com> <alpine.LSU.2.21.2408301114000.1124@pobox.suse.cz>
In-Reply-To: <alpine.LSU.2.21.2408301114000.1124@pobox.suse.cz>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Sat, 31 Aug 2024 00:05:40 +0000
Message-ID: <CABCJKucCWfeC0yL6Q2ZcBfef0tMd9L_gmHRJt-cUYkg_4PDtnA@mail.gmail.com>
Subject: Re: [PATCH v2 16/19] gendwarfksyms: Add support for reserved
 structure fields
To: Miroslav Benes <mbenes@suse.cz>
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

Hi Miroslav,

On Fri, Aug 30, 2024 at 9:34=E2=80=AFAM Miroslav Benes <mbenes@suse.cz> wro=
te:
>
> yes, this is one of the approaches we use in SLES. We add kabi paddings
> to some structures in advance (see [1] as a random example) and then use
> it later if needed.
>
> It is not the only approach. Much more often we do not have a padding and
> use alignment holes ([5]), addition of a new member to the end of a
> structure ([2] or [3]) and such "tricks" ([4] for a newly fully defined
> structure).

Thanks for bringing this up! Sounds like we're also going to need a
way to completely exclude specific fields from the output then. I
think we can use a similar union approach, but instead of instructing
the tool to use another type, we can just indicate that the field
should be skipped. I'll come up with a solution for v3.

Sami

