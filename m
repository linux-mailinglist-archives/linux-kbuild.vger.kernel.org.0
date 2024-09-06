Return-Path: <linux-kbuild+bounces-3445-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DFAED96F86A
	for <lists+linux-kbuild@lfdr.de>; Fri,  6 Sep 2024 17:37:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 56225B212E0
	for <lists+linux-kbuild@lfdr.de>; Fri,  6 Sep 2024 15:37:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C5BC1D2F61;
	Fri,  6 Sep 2024 15:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="ALci5JqW"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB91B1D2F53
	for <linux-kbuild@vger.kernel.org>; Fri,  6 Sep 2024 15:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725637071; cv=none; b=i72kcaYpOsVUKiaZ/JefGWm6p+aivWgsH4L6ry7Cxnnl/R6xxoEVplqyn+kM5TfEc2F65vSn9XG5hV5vH8Qthpe/rKp679n0j7RzkDpZaQ7hthfZ4cr5RBEfq6Tb2F54cKN+KQwClFetD9cDod33yomVCiDWxlmMh0uKnS5xZAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725637071; c=relaxed/simple;
	bh=YYfsMooY6JRsFx5MjH08AaUAn1lLYbeFUCeUENE/piI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZZWsfjhi3boXs+GXeYna3FlGWAGeirOUNTXvG4byoMMW5Let8iu7w5SSr82CXRSjmurmcU4ky0/iwFeK7Q60WfHpe6OVzqyg2J3ph6JwBz9rGl1MBdCDdxfYn7p26x7rWx+6lVhO18zLHtoquQihv994dYdl3qbG9oTa/xvxnTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=ALci5JqW; arc=none smtp.client-ip=209.85.167.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-3df03d1f1ddso1619034b6e.0
        for <linux-kbuild@vger.kernel.org>; Fri, 06 Sep 2024 08:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1725637069; x=1726241869; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=51fSNS3rM+FuqMEGUJ3gTvDTMw/vdesIgPrKMZDJNvk=;
        b=ALci5JqWuhD1I2/5kkz0L0xD4hnsp+NlgaWZubGzpCFsrFWi0aUexPk83NYHY0AQ8j
         0pJbEaeg9JMNFAWDAPx8hHI2srcpDmFvERykR3rTQe35wzN0UJ58TJrwY/V7AQ5L+28Q
         eIPhvWjV/dczc02mDYH0ALMOtl+cvfClV6GYRmZ0hIl5a6VUia5o+G5Vrm/JIYf1AJ+s
         zgLC/vM9KyOG3tnPg2SAWfJA65d2QXwcUegaJ6h1l/sumLzWYfolWZUixlIgElfVwFx9
         YSQjktZDSxd30HkAIDJO74Geu9KYTvS8qoFJDzWf9+R56zm+Cosyb5xlpVVEuDqiZigl
         neEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725637069; x=1726241869;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=51fSNS3rM+FuqMEGUJ3gTvDTMw/vdesIgPrKMZDJNvk=;
        b=VQJfUGzv2AzqyAc6qLu1SQHwwDjPiEzhTMbsdAl41yTflJvQzq6aIHjzGILNqD0bB5
         FMUGW/kNuQsQD7939t579vV91n6Z2XoUUwVvEbZBNN7D1BAky+wzYPmdudEF/TtOaZk+
         RuF9tjbphgcCsCVAyb10d40TEqeWxZpnt6nHjAY2ELpAWZPOlV1o5164bdzan8E8JE4K
         nsiDLxfGp/2p4tkhGXQI6qaeaEZs28Y414EjNiY69ZACnubPMITafeKWzTdMdrB1iZkJ
         5Q9ntAH5NY0DbSmIK3T3dbIA6Ly343toZMn4OcbfHLWUagU4GffL9cPngG5MsfU4oo7P
         Imtw==
X-Forwarded-Encrypted: i=1; AJvYcCX9+GdhWH7JciiYOImy/S+dcJlMy5cYJpjhrjIGjosUgO+wVTtyTeLNy4n33O1udEbEOK7ytHkAMZkbcdQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwWR6yJW5zuPv+0wIJno3vf4oneWpsyPvokVMCFXkM1BCpL7kwa
	HQJlwa/0KFgu5RQv4lPd0OVQC7D+Ti7NZuc2l514Z3r+0Cc5qV0tRvxrfXlzigw2xnSRN6KNnVy
	EuGjcT3M97dYD9aqpH8B3n0ujhwKtxyYd9H8G
X-Google-Smtp-Source: AGHT+IGCTXLw0gynr5maKctmKNni/hD/6+szND2YFDicURbzJQ4hM6uz31CTQAhYHzSUA20t2HKgRIzxt0IIRzb3xIU=
X-Received: by 2002:a05:6808:2e85:b0:3e0:1222:b195 with SMTP id
 5614622812f47-3e01222b388mr9953931b6e.20.1725637068660; Fri, 06 Sep 2024
 08:37:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240809122007.1220219-3-masahiroy@kernel.org>
 <3447459d08dd7ebb58972129cddf1c44@paul-moore.com> <CAK7LNAS4Q1_4T2vafu6wTYsmFsY1h+TA8irqDAqwfoSyw7X=Rw@mail.gmail.com>
In-Reply-To: <CAK7LNAS4Q1_4T2vafu6wTYsmFsY1h+TA8irqDAqwfoSyw7X=Rw@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Fri, 6 Sep 2024 11:37:37 -0400
Message-ID: <CAHC9VhSz+kwYOnkfWPHOmoKCRfOjm3_L5xMLeSGVNxq5g=ikww@mail.gmail.com>
Subject: Re: [PATCH 2/2] selinux: move genheaders to security/selinux/
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-security-module@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Daniel Gomez <da.gomez@samsung.com>, 
	Ondrej Mosnacek <omosnace@redhat.com>, Stephen Smalley <stephen.smalley.work@gmail.com>, 
	selinux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 6, 2024 at 11:19=E2=80=AFAM Masahiro Yamada <masahiroy@kernel.o=
rg> wrote:
> On Tue, Aug 27, 2024 at 6:22=E2=80=AFAM Paul Moore <paul@paul-moore.com> =
wrote:
> > On Aug  9, 2024 Masahiro Yamada <masahiroy@kernel.org> wrote:
> > >
> > > This tool is only used in security/selinux/Makefile.
> > >
> > > There is no reason to keep it under scripts/.
> > >
> > > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> > > ---
> > >  scripts/remove-stale-files                                 | 3 +++
> > >  scripts/selinux/Makefile                                   | 2 +-
> > >  scripts/selinux/genheaders/.gitignore                      | 2 --
> > >  scripts/selinux/genheaders/Makefile                        | 3 ---
> > >  security/selinux/.gitignore                                | 1 +
> > >  security/selinux/Makefile                                  | 7 +++++=
--
> > >  .../selinux/genheaders =3D> security/selinux}/genheaders.c   | 0
> > >  7 files changed, 10 insertions(+), 8 deletions(-)
> > >  delete mode 100644 scripts/selinux/genheaders/.gitignore
> > >  delete mode 100644 scripts/selinux/genheaders/Makefile
> > >  rename {scripts/selinux/genheaders =3D> security/selinux}/genheaders=
.c (100%)
> >
> > As long as there is no harm in keeping genheaders under scripts/selinux=
,
> > and based on your cover letter it would appear that there is no problem
> > with the current location, I would prefer to keep it where it currently
> > lives.
>
> 'make clean' is meant to clean up the tree, but keep
> build artifacts necessary for building external modules.
>
> See the help message:
>
>   clean           - Remove most generated files but keep the config and
>                     enough build support to build external modules
>
> 'make clean' does not clean up under scripts/
> because tools located scripts/ are used in tree-wide
> and often used for external modules as well.
>
> So, scripts/selinux/genheaders/genheaders is left over.
>
> genheaders is locally used in security/selinux/.
>
> 'make clean' will properly clean up security/selinux/genheaders.

Your last sentence is confusing and doesn't align with the rest of
your email, please clarify.

Regardless, this sort of explanation is what one needs to put in the
commit description, a simple "There is no reason to keep it under
scripts/" isn't sufficient.  Patches like this need to provide a well
defined reason to justify the code churn.

--=20
paul-moore.com

