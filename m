Return-Path: <linux-kbuild+bounces-857-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E88984C4F7
	for <lists+linux-kbuild@lfdr.de>; Wed,  7 Feb 2024 07:27:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 80DBB1C22E74
	for <lists+linux-kbuild@lfdr.de>; Wed,  7 Feb 2024 06:27:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE4CFD512;
	Wed,  7 Feb 2024 06:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nbth8gVY"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0FCC1CD21
	for <linux-kbuild@vger.kernel.org>; Wed,  7 Feb 2024 06:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707287255; cv=none; b=QhxOoWVfhro/GbczoCItnkrhylra6cWCA9M4pJTfDJ1CwY6M1irSFdVtiXYc0BzUsIx8ge7/6Zfmf19uXlUjCvVF+NlgyL3AtnVW8hmR8JzmeFER0mKkh3XyllmcBl4zPYaqrQXL90V6eXNpaLSE4b3xWxRnobA4bczRwZo+Up4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707287255; c=relaxed/simple;
	bh=IWTZ61uSjmqMjVLoxaI2rMZ+/qvpa0aKFFdQ7IWsvTw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=CnDWOkl/UrgskKA/shVBUbIIR9g4acmaqAoAi4ADZYhSh+n8o/QtihCDC7rOprzuu6JrYVjRHGWol1GNwNY3iRqTB+gAeb9epnLje70N5D5gc949vpklul7p+pLM1fYRSwWn9tCg0iPfaYFPcN7i4NK1ySfwvlM9mSsvzMxW5T0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nbth8gVY; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-42a029c8e76so1829291cf.2
        for <linux-kbuild@vger.kernel.org>; Tue, 06 Feb 2024 22:27:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707287253; x=1707892053; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=91Kh1X8qqpakkg081kdPL1hMf42K6pa9YSsyPGmjtkw=;
        b=Nbth8gVYFK8GZpNv4MnTckGWs712kU3TGNR9pNrETQtFB0Q66LxFsPNVyA629eUcIm
         f7i0Oh11W8DQ3kdU524GLM4loRd7Ewq9rbbS48GJHKXt5J/8PBtrDh0Zj/uXteupKmqL
         tGRNT6AUeQUMbspriAWgprM8crCyKOO7xLk7NoYaX79iLolu+9NcfeTx4c+F9Cyrgb5v
         kiV6DzbDBbO/Prmx1l4NFR8qTcLpjLeiIyYet+wRrNphP5/EeUtuOgZTV/NjfI+dyJfz
         GNxoLUJqL/2vyubtKsIy2bDJiIWDC6UbTjg5hJBb3qVeRyg0M4OKp176EK6RBYNKir5Z
         6U6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707287253; x=1707892053;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=91Kh1X8qqpakkg081kdPL1hMf42K6pa9YSsyPGmjtkw=;
        b=X59D0RfX1/8alO0oo0CWrdvqMgB5v+a2gqQjHzIy/MEDh/r4LKcz9kQZ+25Yn755NM
         EvMdrE5ADXltMv0gYDIW/R1O4eWIhibjya8sJ66fcs5Rlr4PYfM4/93n65QwU/BPpqPF
         aRHXhh9aAN98YEFlMt+0hYyTirsgK7v95OlHqzcSFp8wprEZuw+MQyXsS5mwl0T1ME3r
         +ezc+bJtu0IDdSFId0dc4140H8AZl8sCZQs8uKXJDRgIt8MkpUoEtWzAzPIWsfjuhRFB
         YjsfN63JPSfAjp9r6BQY0zemVVtb9Y9sILPXVB+rZA/zABwGxAs+z3apGOiH6dilK8wP
         C5cQ==
X-Gm-Message-State: AOJu0YwsApmm9ip8SzJToiZhs8dhATBd6mLgCGeQqK9qtA2lafoqgpS6
	bqcdz6/CDqi/ryYZF/1ouxThs3Rj1yF/4by/36Pu+PpNZ9LRifWFKGJxhRlQZhpPLyRTyVbh7/J
	Y28wVtVoINmIbzr5GrC7tLGycbAk=
X-Google-Smtp-Source: AGHT+IFY+3Pc0BFY5jtCsZlhLeqtoWSKA0RTQfZAOgOLAAIV5VPnyH4b2/i2TlwCr7MR16yE1h6+sazvwOPEPsvMbZA=
X-Received: by 2002:a05:622a:1456:b0:42c:1818:c5f0 with SMTP id
 v22-20020a05622a145600b0042c1818c5f0mr4795739qtx.12.1707287252766; Tue, 06
 Feb 2024 22:27:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAGRSmLshjakU3pXu_odd1-et2KfOUrhTruRcRBP=T-dhnYRVzg@mail.gmail.com>
 <CAK7LNAQ6ZrcX6XqxcjgrnHiV9BHFOvTchccxzQE4JGq7W0FqWw@mail.gmail.com>
 <CAGRSmLs9M+XAk6q=7s_aGMfjAHkTVEtYszsTsoBkSdwPoeTd9g@mail.gmail.com>
 <CAGRSmLs_7DjjZazExF+cjHCzaiRsrfKNh89au+nF-dkhQ79uwA@mail.gmail.com> <ZbywIl-RU3xRGaj6@buildd.core.avm.de>
In-Reply-To: <ZbywIl-RU3xRGaj6@buildd.core.avm.de>
From: "David F." <df7729@gmail.com>
Date: Tue, 6 Feb 2024 22:27:22 -0800
Message-ID: <CAGRSmLst0Y7Brm0SJQqm6Z1yH_mLf8WCR07f0AqR2XtLtFxedg@mail.gmail.com>
Subject: Re: Changes to kbuild in 6.x causing cpp build issues.
To: "David F." <df7729@gmail.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks, here's what I came up with in case someone is searching some day:

#------------ new section for kbuild .cmd requirement -------------

cpp_build_opts=3D`cat $(FLAGS)`

# called by existing Makedisk.build gen_symversions
cmd_gensymtypes_cc =3D $(CPP) -D__GENKSYMS__ $(cpp_build_opts)
$(CC_FLAGS) $< | $(genksyms)

# command to build using g++_
quiet_cmd_cc_o_cc =3D g++ $(quiet_modtag)  $@
      cmd_cc_o_cc =3D g++ $(cpp_build_opts) $(CC_FLAGS) -fno-builtin
-nostdlib -std=3Dc++0x -fno-exceptions -fno-rtti -Wall -c -o $@ $<

ifdef CONFIG_MODVERSIONS
# setup call for build rules
cmd_gen_symversions_cc =3D $(call gen_symversions,cc)
endif

# multiple items to do on build of .cc file
define rule_cc_o_cc
$(call cmd_and_fixdep,cc_o_cc)
$(call cmd,gen_symversions_cc)
endef

# pattern for compiling the c++ parts (required for cpp file building)
%.o: %.cc $(FLAGS) FORCE
$(info doing [$@])
$(call if_changed_rule,cc_o_cc)

#---------------  end kbuild .cmd requirement build ---------------

On Fri, Feb 2, 2024 at 1:04=E2=80=AFAM Nicolas Schier <n.schier@avm.de> wro=
te:
>
> On Thu, Feb 01, 2024 at 09:51:34PM -0800, David F. wrote:
> > Any help would be appreciated on how to create the *.o.cmd file for .cp=
p files?
>
> Neither tested nor evaluated in-depth:
> You might want to have a look at scripts/Makefile.build and
> scripts/Kbuild.include.  If you are able to include the relevant kbuild
> parts in your Makefile, you could try to supply a cmd_cc_o_cc definition
> and use it with if_changed macro.
>
> Kind regards,
> Nicolas

