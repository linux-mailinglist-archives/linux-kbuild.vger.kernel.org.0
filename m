Return-Path: <linux-kbuild+bounces-6944-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CB6EAA9DC0
	for <lists+linux-kbuild@lfdr.de>; Mon,  5 May 2025 23:05:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E50C417DAC8
	for <lists+linux-kbuild@lfdr.de>; Mon,  5 May 2025 21:05:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABB882741B0;
	Mon,  5 May 2025 21:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="WhgsSo9J"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92B29270548
	for <linux-kbuild@vger.kernel.org>; Mon,  5 May 2025 21:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746479101; cv=none; b=idwfM0+GNFMV1Q9Ro9nilVyHuxu6Wvx+TCDJNYAwrEUroGl7FwrwZ/oMfAi2WqKOG9lwmKZtNdsk0ZmiMo0A2azNO/p2qkBQdsBcKkqgigABLZE+IMBqVuMZXDZOUhEpRrolRO6KSWKYc+Jwq9RUJCkMNKXeYSUlpsqumLv+KbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746479101; c=relaxed/simple;
	bh=pvJm4iJToWGX01vWFAWNiClNkhuZHWWKlI9oy7VPwrk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j0E4dXJcGEFeFnM64IqjO5kkRpQ/kSjEU7IIcCrm4mKbcc7d7DJsroJXGqIXjNGl+UgoOuaUO9kFrz7mrq1U6Yu4AG4lJ5FswVOHl4OPGUN4GlZvO7VKoKSPMGwZyrY0nFDaATFRXPZSXdM+wP7n0uaq+OMvwAJFiUoB4wtHBug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=WhgsSo9J; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-7086dcab64bso45796157b3.1
        for <linux-kbuild@vger.kernel.org>; Mon, 05 May 2025 14:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1746479098; x=1747083898; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qV6Ehr5flIzxPNkBJYbjhBPm/Nie/yPzlaQWxf1OGLY=;
        b=WhgsSo9JWV48EKUKRmgKeuu2vJsYMPLJ1pLf+ibrUGTWn2+WkRrraD+IuzYDCHdsgi
         TTDKbg3e0i/eTbdgI7l2QVK9n+kI6ObrZPtfmtNfL6qlZz7+41N8oEYLIPnbj2iALqTn
         Q/Cbc8qsYJ5YdcG1kADDtxqU59toKqXSim9JJDVAhrJ9jSOKR2EUyWklInE1QZftyxzS
         Xy5L+DZJtUBnNvNxpVf7D0wvIpluIpP8tW0iRyAtZ+KsLBR8uXQ38omd9fXF9QzLJJWM
         Jm0W5mbRYgTmCH2APZteUpOA4pIIyDAfPbaFAL4S+GSuat4CMUTYEnHGbaXEHzMdZXO3
         5wfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746479098; x=1747083898;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qV6Ehr5flIzxPNkBJYbjhBPm/Nie/yPzlaQWxf1OGLY=;
        b=hsJl15PCHU3camqkpWcPJVtP8YvVO4wGxWgZ6bDEIRnrId9hBguQRwN7YBu2i/bTAG
         5nYDv2bh0ospCNuOHcR7bXN3thX28tgt1piTWvkpHlb5TAmVbAnj5t3yQgF1x+YQpSA0
         fdcP27Cc9yLUYSk6+XD8XdTMSg1j9TgPCqEjzPuYNLvMn9nOctlPReNh7hT4tGH5S4Ac
         CtHZV+qDJfZkDJ21MnDjl5rI0/IvqTbTOpmRjPawHHqs0pdhgQvQeHRyDfJQ65R7LXI5
         cDan7eA8IOhg2QFZTKmGqe5vKQNbtc4qWuvbKhzVfkuYoPjJ234CO/g0L7wNqtN5Ota3
         rfNA==
X-Forwarded-Encrypted: i=1; AJvYcCWjRCbFhu+Bz+zZachbBrxacy72ROdLeMQxcfC7wcCQxLhB85rSNUdD2UBTmfXCYB5A+yeS2+mpux/hSnE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwmwUbFazZG6f7SlwCyMqgSxiSjX5dxARG8vS12au5jumjVFeyw
	U6uj7HCgE3Ctpor3vgthYQq8EQNNt04U0mqeCLDvYdZYAd7CTlz6zfasOGbTbNWaz74PvUeioLa
	YUD67OvnPyIma9Y8hVfiXpCQxbKtAl5IOW9zo
X-Gm-Gg: ASbGncs+DWXyIMCyjkN09RgUedlzAlKgccVleu2Ac+z+Y9VlTEz47FFUEeyFUMe27ko
	ynJrNp63Hretuw3xBOC6391s5CVngqGH/1EerFTc1833M5C6kI1LCa3WbD9bubAJx86y1fEAQ/V
	RIYNrHNa/d7i+0ZmtPWNzZwg==
X-Google-Smtp-Source: AGHT+IFmAkNEdgI8Usf/OOS6czpCIUfjzjMmDrrLFeB8TbVt16spO751vhSxBgmbdO5FhYFLhIwyiyfP8SeItQ5Z+90=
X-Received: by 2002:a05:690c:368b:b0:703:c3ed:1f61 with SMTP id
 00721157ae682-708eaeef043mr127166017b3.20.1746479098491; Mon, 05 May 2025
 14:04:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250502184421.1424368-1-bboscaccy@linux.microsoft.com>
 <20250502210034.284051-1-kpsingh@kernel.org> <87o6w7ge3o.fsf@microsoft.com> <CACYkzJ7Ur4kFaGZTDvcFJpn0ZwJ9V+=3ZefUURtkrQGfa68zLg@mail.gmail.com>
In-Reply-To: <CACYkzJ7Ur4kFaGZTDvcFJpn0ZwJ9V+=3ZefUURtkrQGfa68zLg@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 5 May 2025 17:04:47 -0400
X-Gm-Features: ATxdqUH7QOdmAmbomuCBMV4FUrVw8a-HbJeWUtKQ1wX8nnex6ppuCCrqNPrIXY8
Message-ID: <CAHC9VhRwpvQQyMmFTeiQaos0+yJDkuCkt03QcYdnsxUvBXAtVA@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] Introducing Hornet LSM
To: KP Singh <kpsingh@kernel.org>
Cc: Blaise Boscaccy <bboscaccy@linux.microsoft.com>, James.Bottomley@hansenpartnership.com, 
	bpf@vger.kernel.org, code@tyhicks.com, corbet@lwn.net, davem@davemloft.net, 
	dhowells@redhat.com, gnoack@google.com, herbert@gondor.apana.org.au, 
	jarkko@kernel.org, jmorris@namei.org, jstancek@redhat.com, 
	justinstitt@google.com, keyrings@vger.kernel.org, 
	linux-crypto@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-security-module@vger.kernel.org, 
	llvm@lists.linux.dev, masahiroy@kernel.org, mic@digikod.net, morbo@google.com, 
	nathan@kernel.org, neal@gompa.dev, nick.desaulniers+lkml@gmail.com, 
	nicolas@fjasle.eu, nkapron@google.com, roberto.sassu@huawei.com, 
	serge@hallyn.com, shuah@kernel.org, teknoraver@meta.com, 
	xiyou.wangcong@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 5, 2025 at 4:41=E2=80=AFPM KP Singh <kpsingh@kernel.org> wrote:
> On Mon, May 5, 2025 at 7:30=E2=80=AFPM Blaise Boscaccy
> <bboscaccy@linux.microsoft.com> wrote:
> >
> > KP Singh <kpsingh@kernel.org> writes:
> >
> > [...]
> >
> > > Now if you really care about the use-case and want to work with the m=
aintainers
> > > and implement signing for the community, here's how we think it shoul=
d be done:
> > >
> > > * The core signing logic and the tooling stays in BPF, something that=
 the users
> > >   are already using. No new tooling.
> > > * The policy decision on the effect of signing can be built into vari=
ous
> > >   existing LSMs. I don't think we need a new LSM for it.
> > > * A simple UAPI (emphasis on UAPI!) change to union bpf_attr in uapi/=
bpf.h in
> > >   the BPF_PROG_LOAD command:
> > >
> > > __aligned_u64 signature;
> > > __u32 signature_size;
> >
> > I think having some actual details on the various parties' requirements
> > here would be helpful. KP, I do look forward to seeing your design;
> > however, having code signing proposals where the capabilities are
> > dictated from above and any dissent is dismissed as "you're doing it
> > wrong" isn't going to be helpful to anyone that needs to use this in
> > practice.
>
> Please don't misrepresent the facts ...

KP, I believe the most constructive thing at this point is to share
your design idea with this thread as previously requested so everyone
can review it.  We can continue to argue about how we got to where we
are at if you like, but that isn't likely to help us move towards a
solution.  If you are unable to share your design idea, either in a
couple of paragraphs or in some form of PoC, please let us know.

--=20
paul-moore.com

