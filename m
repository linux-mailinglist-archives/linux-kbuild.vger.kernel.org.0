Return-Path: <linux-kbuild+bounces-9457-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 51BF6C42786
	for <lists+linux-kbuild@lfdr.de>; Sat, 08 Nov 2025 06:10:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 167BC4E3BBE
	for <lists+linux-kbuild@lfdr.de>; Sat,  8 Nov 2025 05:10:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5B4038DF9;
	Sat,  8 Nov 2025 05:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kOOedfTI"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C69A22A4DB
	for <linux-kbuild@vger.kernel.org>; Sat,  8 Nov 2025 05:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762578634; cv=none; b=McfOy2DYd6Aga5+LWhIOyvvNanakjoqpr84P+sjh3rMPUvfQi0kk5qF9vdia2Zu8ZfQaJXH4IcVu3Op1xTnJTYB5x8Z4GR1hwuGQ6VitKrM0fqU2QIJaOLbjblwa7s2LtCBWmHADBqu7XUyJ5ea7LqFc9W8fTbyT46KQlwlh8/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762578634; c=relaxed/simple;
	bh=INEsrDL3ZFOVJV6ZxDDmepCrXJUSxIqBndjxXSBnJHM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OChUkzqudoB+KGHfo7GjYcP09AAb3Q8Zr/GXrCll0WTIVQWR4mA2fNpV6HAkl0L8zU7xUDetYutKNH200yztgFWqpwzX/ETly14BHMLdq+CmZ29/2fbKGQGXVz1tsXD5v7jnFSuI10ZMyOC/zhKqLx4yHY37GLLTzrB+VJ8WJh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kOOedfTI; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-295395ceda3so1318035ad.2
        for <linux-kbuild@vger.kernel.org>; Fri, 07 Nov 2025 21:10:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762578631; x=1763183431; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=INEsrDL3ZFOVJV6ZxDDmepCrXJUSxIqBndjxXSBnJHM=;
        b=kOOedfTIxhWVBJqaOnoL7JiSFy1med7LiUggHTUM5euZtZQjRUFBcZd7dbiJnJN8x/
         KMqwqbd3N0oznq2Au+97Nx2ZXEUcUl1Q6hPC6k4hysF+XxBe1OjtTCLdqaOgG5EVbHug
         VoQYyqa3MIfBqVPh4m7cvh7/SUMR+U1SPvPRvQNgmLxxR1PevjdVLY0YQenBP2fScYBg
         QpCQoh6JsLkDhW42fnl+GzQBmwyphkBSF1lgt32Y/UgqL3DjrD0/aqHLl8jBg0cr6jBb
         un67yYShxFcuKH4yAHOajILRGfW1XvMyKVMWVMJefRKiLdfFZwaZW9EGbHo/teKb67Kn
         k4WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762578631; x=1763183431;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=INEsrDL3ZFOVJV6ZxDDmepCrXJUSxIqBndjxXSBnJHM=;
        b=SVzyOEGFaoRXbMCjzQ4MoseBcu6kzshYseRzD5VicTimrtKUHDx1BKBlFzyOE61Ppz
         6tJKWLW1tzjH1iVWICjrMOkDUif7s1Szpk7OQg4+45o1Sz7ZlbuO2Cv71LFlHDAArUUr
         mgRjtEw0gdQLabANx7cju36aNS9ZSH7RxE0JBceyyMfhJ3hDGJA8dUdX2ADbAWt4KTqL
         2EzBAsr+qKcfucs26Mytcm2Mt92VirOB6//tLWJYxCtr3IyqR1ym2DW1ibktaTObdz8F
         jHycZQeGO60iF5lvnHCSaQa2JvxHqe18OFWre0/yCz8xEEDGE16mXUMAmactPZ+WhjC/
         75HA==
X-Forwarded-Encrypted: i=1; AJvYcCVwqCA/5yv871nlo3uKng18T3slkez3A9mOvHrgABX3byWohDmawO9JVCehiJL5aJiaeHKwI+3QGGanH+E=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzq21uD4yxln+jxgJwcY28nTGcGxBqN6Dnqf0gwSS34gUR6RMFG
	/FU85z0hH8JfGcyw1CnQW74oMqv8LbjjlWUyPBkk2vIiukEwafob+WSEcHIN28WGYgIEgMWFglW
	xDkkVE6o6DvLyaalDQJEvqOaIEdJV+aM=
X-Gm-Gg: ASbGncsiLVdnMqECNjOotgIJdrWYnpAL3iG1IVOJnPOZhwVolQf67TNaNOoxtYZmbP8
	zDysahns8Er2IPrgC+unUyCg5zbWLARPembiTyEg80BuB+7IQPxGDAdNkdQBZ9eUaly4l6rmEoU
	DIBJx2UCWeT0wimcGjOUivGi0lFP+peUBI6MeMYxg/p6Gtd/5lF+Fw5OadYRSKN9g0Os97a5dfP
	tTAPtd8e52WaxoTu+DAWrzTSSiodyb1mKeujPJkKbTull9CrE1ZE9n/qURSLEKg40xKYrrsYO4P
	TyVBoE2CL/aJDOvjRXU1aFbuvOv6p5/eVFSYkpTk8fzDDp6dFLwVATDlwPzQcwHRvKREYBW9d5I
	VcY4=
X-Google-Smtp-Source: AGHT+IFpkWjaZPfFIdXLCNNvaUpFsNrIzi/soaYDSl43HhGv5JtmjMSLTRnBgkPYtWq32m0IIjqkxR9ElEvFzEQGC18=
X-Received: by 2002:a17:903:3848:b0:295:f926:c030 with SMTP id
 d9443c01a7336-297e5611fe0mr11021635ad.2.1762578631544; Fri, 07 Nov 2025
 21:10:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <b8c1c73d-bf8b-4bf2-beb1-84ffdcd60547@163.com> <CANiq72kX4Yep3pNVq8Ge=txQbPnMO=zKsci5cPgz5LDS=D6NoQ@mail.gmail.com>
 <CABCJKud0G+Xh+Wbtg4SDGvk4Yh5nmt5YgHEPj-H0y8GO5R3Amw@mail.gmail.com>
 <CANiq72mw66ADx7LoUuqY6h9KCU=uFzcNQXZ21kMP7jBjCyyaHQ@mail.gmail.com>
 <CANiq72=OFO8fBpJ6xvGunYrx5hXfcjQJ=YDqFxtMPWDzfzwpKw@mail.gmail.com> <CABCJKue1xeY7CGHScG04PdHT6TOPgsOpZVKWwgzO65qwAcbEJg@mail.gmail.com>
In-Reply-To: <CABCJKue1xeY7CGHScG04PdHT6TOPgsOpZVKWwgzO65qwAcbEJg@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 8 Nov 2025 06:10:19 +0100
X-Gm-Features: AWmQ_bm_JWCStYGdxhk5txWeRYQcMcxjFaV5hIKidHxgDSHYk_c2QUGj1XKDqWY
Message-ID: <CANiq72=c8j6DvbY7JiaR-JygXcd0AESeNpuot9CpFaA3ueupTg@mail.gmail.com>
Subject: Re: Only rust/bindings.o build fail on rust-1.91.0
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Haiyue Wang <haiyuewa@163.com>, rust-for-linux@vger.kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, linux-modules@vger.kernel.org, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 8, 2025 at 3:40=E2=80=AFAM Sami Tolvanen <samitolvanen@google.c=
om> wrote:
>
> I'm not sure it makes sense to silently export unusable symbols. I
> feel like we should either ensure there's debugging information for
> these symbols, or just not export them.

(Now that I saw your other reply and things are clearer, replying here
as well for completeness)

No, I didn't mean to silently export, but rather to avoid failing due
to missing DWARF if there is nothing to do for that object file
because there are no exports. That is, what we manually do now with
some of the `skip_gendwarfksyms`, but dynamically, which unties us
from the inlining decisions of `rustc` which could hit us in e.g.
small crates in the future or edge cases like the bindings one.

Cheers,
Miguel

