Return-Path: <linux-kbuild+bounces-4764-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E9EE9D4882
	for <lists+linux-kbuild@lfdr.de>; Thu, 21 Nov 2024 09:09:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3FD44B221F2
	for <lists+linux-kbuild@lfdr.de>; Thu, 21 Nov 2024 08:09:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55E391CB306;
	Thu, 21 Nov 2024 08:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="UB1IE6oX";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="2fS3USbt"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8760A1CACE9;
	Thu, 21 Nov 2024 08:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732176580; cv=none; b=F4MYbAiXMDxsvV+jVX3E5X7c2dZO3OWadX83+38+iU25DL6MpVYWAkfXHojCm9GOixOt63h4AOyH9d/e4e9XpDjRHMkl9BRUPHMydIMhfU8x0fNGUaiXif6vO1L2f39fOVRlPdYLv8OFbic3VH0QMptlOk//o/je6QITzgOl7TY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732176580; c=relaxed/simple;
	bh=BvEyhnyI0XDIdgF3tPtxKSiOJGP23vgPNFMQaakLTGk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uNwM+vfFswGF0cy08wfjaAOrBFUJc0wIeoESo5LfGF5J6uMoi6d9Iq+aMuvpKJy4wwE2XOrh5yb96RTflqNR0gUJD8ZNzl/niH7hoRZGXD3o7+LnlfgIcxhc4/ZdQRNAktjHNeOAPg80eU5S01FYyEHNzBY6jpBpZt8aOl+5uCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=UB1IE6oX; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=2fS3USbt; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Date: Thu, 21 Nov 2024 09:09:33 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1732176576;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=be4tTM+SqMFCpbwOaFbBKI9pXVAlJLs1b+OQG81BDrs=;
	b=UB1IE6oXBYkFO/J97uHPV36m2ZdVgvPsU3jm7lCpx596p7Azoyhc2fVVnuf0FWLD7gQD8m
	a2JbPEqfEiYuTZfhypdbGYkNbJ7Ov42HvPPsGHWplmyphQCmdWpt1txwLR28FHgwuiwJhn
	AVVpcw8eka6OuCon2vva3e0ofwng2wMe8Sb5Zu/z7pDGkEYJf7Jopuic9T1bS/9y8CDgoc
	2dkPR0p99xweKWkNoaiXV+d8JPZEMlExd2FAIURH3h9YBEhuzCcU8Um5xlZaiSvEH/6Z9e
	SY27fHC7om4OliyidxSbH1OjMytxDMshQRCWs6WsQKFXtINk8HYRZP8UYLsC3g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1732176576;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=be4tTM+SqMFCpbwOaFbBKI9pXVAlJLs1b+OQG81BDrs=;
	b=2fS3USbtB9V1nqNf8D3rhSHW0dmQUQ/lw6VtQ7sw7sg8MLyODHqkUkHRn5sY5wqzeyycPk
	nPcUq3tVXnYWWiCg==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Paul Moore <paul@paul-moore.com>, 
	Stephen Smalley <stephen.smalley.work@gmail.com>, Ondrej Mosnacek <omosnace@redhat.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org, 
	selinux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selinux: explicitly clean generated av_permissions.h
Message-ID: <20241121085228-327b3d62-4e9b-4f4e-9100-b62bcedfab1d@linutronix.de>
References: <20241120-selinux-clean-v1-1-68704e007f7a@linutronix.de>
 <CAK7LNATUnCPt03BRFSKh1EH=+Sy0Q48wE4ER0BZdJqOb_44L8w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK7LNATUnCPt03BRFSKh1EH=+Sy0Q48wE4ER0BZdJqOb_44L8w@mail.gmail.com>

Hi,

On Wed, Nov 20, 2024 at 08:55:00PM +0900, Masahiro Yamada wrote:
> On Wed, Nov 20, 2024 at 6:15 PM Thomas Weißschuh
> <thomas.weissschuh@linutronix.de> wrote:
> >
> > av_permissions.h is not declared as a target and therefore won't be
> > added to clean-files automatically by kbuild.
> > For details why it is not a target see the Makefile itself.
> >
> > Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
> > ---
> >  security/selinux/Makefile | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/security/selinux/Makefile b/security/selinux/Makefile
> > index 86f0575f670da66a9dc57e13a236d6a5551af38e..58129a7c8cfa08f9caf5444f7df776f41056b77a 100644
> > --- a/security/selinux/Makefile
> > +++ b/security/selinux/Makefile
> > @@ -41,5 +41,8 @@ targets += flask.h
> >  $(obj)/flask.h: $(obj)/genheaders FORCE
> >         $(call if_changed,genhdrs)
> >
> > +# see the note above, remove this line
> > +clean-files += av_permissions.h
> > +
> >  hostprogs := genheaders
> >  HOST_EXTRACFLAGS += -I$(srctree)/security/selinux/include
> 
> 
> 
> Presumably, the attached fixup.diff (comment in 'targets' assignment)
> would align with the intention of the maintainer of this Makefile
> because you can do
> 
>   targets += $(genhdrs)
> 
> without the need of the grouped target feature.
> 'make clean' removes files listed in 'targets'.
> 
> 
> 
> BTW, the NOTE in this Makefile is not true.
>   https://github.com/torvalds/linux/blob/v6.12/security/selinux/Makefile#L7
> 
> 
> Even if you use GNU Make 4.3, the grouped target does not work with
> the if_changed macro.
> 
> With GNU Make 4.4, it will work as a side-effect of commit
> fabb03eac412b5ea19f1a97be31dc8c6fa7fc047
> 
> 
> I asked about this behavior some time ago in GNU Make ML.
> 
> https://lists.gnu.org/archive/html/help-make/2024-08/msg00001.html
>   or
> https://savannah.gnu.org/bugs/index.php?66073
> 
> 
> The combination of the grouped target and if_changed
> is working with GNU Make 4.4+, but I do not know if
> it is future promising.

Thanks for all the insights!

> IMHO, I do not see much benefits for using the group target in this case
> because you can still generate flask.h and av_permissions.h
> separately.

I'm fine either way.

@Selinux maintainers:

What do you prefer? Also feel free to just commit whatever you think is
best.


Thomas

