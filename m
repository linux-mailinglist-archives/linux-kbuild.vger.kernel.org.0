Return-Path: <linux-kbuild+bounces-4436-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 72C7A9B7245
	for <lists+linux-kbuild@lfdr.de>; Thu, 31 Oct 2024 02:57:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 95F901C220A4
	for <lists+linux-kbuild@lfdr.de>; Thu, 31 Oct 2024 01:57:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7CC453A7;
	Thu, 31 Oct 2024 01:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HkPSf/B2"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA408288B5;
	Thu, 31 Oct 2024 01:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730339849; cv=none; b=uioJ2j0ywkVuF5sjRLlIKNTTlZxF6h2P6nQ+MeJL/bxu28lB2Af6/O8xNEogwM0RkGOJWVLEqkWnpZxk7TzHV9N5IghidTjA6EYv4B8KNqpxoUH/tHJNC1zS+k6XosjhTbpMzK4P+V88xlIOxn0xuKY3AS5p3Ph881SAtHj0fp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730339849; c=relaxed/simple;
	bh=0nGzX7cvoxaUK7ySnJHlrYRZOHqiEXeRUQ9nAXlxSN0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NSeRNs8TuQRkDBxcl17gEEaW4RDZF8/JLTGdLNnMEiriCrjhKQtPMIC435fNM1A45xUO+2HFSlmok0tlgNW6b8IhKfX+BBS9miLScslExcbTeVf37CU5m03aCn29Q3TVjzMGFFVI1tNp8qSlBW/MYgHnUOEaNHsf0CxTUbHTvjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HkPSf/B2; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-53c78ebe580so564464e87.1;
        Wed, 30 Oct 2024 18:57:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730339846; x=1730944646; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0nGzX7cvoxaUK7ySnJHlrYRZOHqiEXeRUQ9nAXlxSN0=;
        b=HkPSf/B2eGHIwjFgZWu6BsigBGLzhM3zbbQoJk+yhHFbPA41jaWiDyvfdEZ1gNbk6N
         Iq60/QQI0sjTBzfSmT2Iv690I7oqfjQxxh2BRYwUrOUmZduMgU77NxEgLc1ACVU79Zt4
         PdDQCh/O3Nqzfz5pm8jQHhFKaPiYZnvyHQjQYQdl5oG+hxkoGuhF25hzjfhGHsD99OoL
         5eDm1ihFCjuFR2y9JemukzoPnjqgFuRCazkXPkK6kQciSnlrseBmARO0kkYGEHIIzuad
         jlG2qLBy1d6zP0N0IE2RVtVctuSNR+lwR7CniEWhUN6alw48qts6DfhcApkdXnDUp02U
         E1AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730339846; x=1730944646;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0nGzX7cvoxaUK7ySnJHlrYRZOHqiEXeRUQ9nAXlxSN0=;
        b=nkOPp+dmE6GoeCPk/PyN/tCn3R63zc28n8DwHUGzb+GDbBx5Sbz9Uxl2/yEqztKpSV
         nB+V2pJctAtMwWgig/YXb9CPxtGibBC9CS6wldEROBEecBywpxz0pNh6AguNgIMI/zqf
         e8jfQBUIZCF6aMPaHfiFFo089b6BY37VDhHK/7XdioGmJmsgSUGwls6GAMtjVoCmooR5
         sgDt/toW2SncKR/qCK6UfCeFW0KwPLxQkXelM07QM/3eYK7vZm35mQdfFvztuAP1BxSx
         UsXH3vt5+cJCRmIH9PDg1DXMv14u55SZI1AGd8hTKkKEQ9X5fwt7z5TJDkJUfUVzGgi1
         sazA==
X-Forwarded-Encrypted: i=1; AJvYcCVpj1EViFoO13B77p3zQFobQZYYsF/5Yoe0lP4UMslQgSQHILJEkXRavFgmbDA7fIthn7CixZUZpnSNeXJ8uw==@vger.kernel.org, AJvYcCVzylGvv34/NNayAK6xedJ0dYVp4cC3e5EOfamf3XGZkWwimDG5HtjIUuTejgTyUT0h2C8pDPECWdAd5Gw=@vger.kernel.org, AJvYcCW8AplY1RxLdvFOVOnzo9/SQxNnBVjnu6PBG9GVnkDGFGwBRb3PrHi2hEy2MXNoOD5PqtwV+VjA25XE8743kIM=@vger.kernel.org, AJvYcCWtgHMfOgWfyj0FZyLuQMyDZvo3ZGkSEAup/44N23bD4XZlq45C4ARVOWJAII/x3L7WMMeeFjmMtNQRJ1V8@vger.kernel.org
X-Gm-Message-State: AOJu0YzFw2SJddSj5WL+AFGzqxvJXatGgw4fN1CJtOCyd+XD/xXmT91C
	J3k6xTxYMWrnH1jI2QQLVfhcDHSNhozO48Oa8ueFZltMBGOYKIW+irfJgVsIaZq3o0nd+ILnkkm
	ZgEiDXD7v4Y+vUMdnOlF75JYsA7U=
X-Google-Smtp-Source: AGHT+IGpPkVwwPSIxo8IYBpRNuyJN+Nwt4EGdkKqDyMJU+J6uO8LH84FTUGSBjjnWzI6pB8h3tfIYXFF2CGMvBU+BYY=
X-Received: by 2002:a05:6512:39c8:b0:539:f23b:59cc with SMTP id
 2adb3069b0e04-53c7bc36922mr218912e87.22.1730339845561; Wed, 30 Oct 2024
 18:57:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241030170106.1501763-21-samitolvanen@google.com>
 <CA+icZUWTdgM7HQrnR_NzgZZQE3aXXk+tAqD3srNd1Eyjr5d7EA@mail.gmail.com> <CABCJKuepGSFcQa0F5iO4aa4V2UbhuKO+tyfhB3_ODaTGs3sM5Q@mail.gmail.com>
In-Reply-To: <CABCJKuepGSFcQa0F5iO4aa4V2UbhuKO+tyfhB3_ODaTGs3sM5Q@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Thu, 31 Oct 2024 02:56:49 +0100
Message-ID: <CA+icZUXdMGk5uTZ_as0UOw-zmZuxTXc6J3U2_He00UOca86Gig@mail.gmail.com>
Subject: Re: [PATCH v5 00/19] Implement DWARF modversions
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Matthew Maurer <mmaurer@google.com>, Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, 
	Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@samsung.com>, Neal Gompa <neal@gompa.dev>, 
	Hector Martin <marcan@marcan.st>, Janne Grunau <j@jannau.net>, Miroslav Benes <mbenes@suse.cz>, 
	Asahi Linux <asahi@lists.linux.dev>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 30, 2024 at 10:14=E2=80=AFPM Sami Tolvanen <samitolvanen@google=
.com> wrote:
>
> Hi Sedat,
>
> On Wed, Oct 30, 2024 at 2:00=E2=80=AFPM Sedat Dilek <sedat.dilek@gmail.co=
m> wrote:
> >
> > Hi Sami,
> >
> > perfect timing: Nathan uploaded SLIM LLVM toolchain v19.1.3
> >
> > KBUILD_GENDWARFKSYMS_STABLE is to be set manually?
> > What value is recommended?
>
> The usage is similar to KBUILD_SYMTYPES, you can just set
> KBUILD_GENDWARFKSYMS_STABLE=3D1 to use --stable when calculating
> versions. However, it's not normally necessary to set this flag at all
> when building your own kernel, it's mostly for distributions.
>
> Sami

OK, thanks.

# cat /proc/version
Linux version 6.12.0-rc5-1-amd64-clang19-kcfi
(sedat.dilek@gmail.com@iniza) (ClangBuiltLinux clang version 19.1.3
(https://github.com/llvm/llvm-project.git
ab51eccf88f5321e7c60591c5546b254b6afab99), ClangBuiltLinux LLD 19.1.3
(https://github.com/llvm/llvm-project.git
ab51eccf88f5321e7c60591c5546b254b6afab99)) #1~trixie+dileks SMP
PREEMPT_DYNAMIC 2024-10-30

Tested-by: Sedat Dilek <sedat,dilek@gmail.com> # LLVM/Clang v19.1.3 on x86-=
64

Best regards,
-Sedat-

