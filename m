Return-Path: <linux-kbuild+bounces-2142-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BBE3909F45
	for <lists+linux-kbuild@lfdr.de>; Sun, 16 Jun 2024 20:41:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A32881F21C4A
	for <lists+linux-kbuild@lfdr.de>; Sun, 16 Jun 2024 18:41:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6F22210EE;
	Sun, 16 Jun 2024 18:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="unknown key version" (0-bit key) header.d=smtpservice.net header.i=@smtpservice.net header.b="ST0NvJSa";
	dkim=pass (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b="k37ZOcr4";
	dkim=pass (1024-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b="J6yFXe9o"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from e2i411.smtp2go.com (e2i411.smtp2go.com [103.2.141.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F2A11CA85
	for <linux-kbuild@vger.kernel.org>; Sun, 16 Jun 2024 18:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.2.141.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718563296; cv=none; b=jPkG9pyPu0Kpbe5WlbdJfgW3lvcc/D2JXKDBENAisVXUsG8s436nX36W5JZ857usuuw6mcWvir386KYaMVaKuE+RdsDw7TpOBLSPWQssrYrS24EOZ26/RXgQzTK07nmdpAjijYRZokonTTUcv9g/VVnNSC3s4MEObwq5Q3+YFdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718563296; c=relaxed/simple;
	bh=6ACv2bY6r0zfKilkhSR0qAqUlb4hMLiS2w9z7El4auw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M2VW7NObsVNlYVtUjLwM0XIdt0ZKHibHa2KD5KSjvV6PMyum8lMb8K3pzFqRvh47QpXhg1NnrRDJ0v7v013eEHLeQZ4hsxyzvwW0sGfJUO/fNToMiqbcvZbuTw9ZM9Kn93MWYwM0mFUFmI0LwOCXtbWthNhxowTC3TEsHkyClJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu; spf=pass smtp.mailfrom=em1174286.fjasle.eu; dkim=fail (0-bit key) header.d=smtpservice.net header.i=@smtpservice.net header.b=ST0NvJSa reason="unknown key version"; dkim=pass (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b=k37ZOcr4; dkim=pass (1024-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b=J6yFXe9o; arc=none smtp.client-ip=103.2.141.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=em1174286.fjasle.eu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=smtpservice.net; s=mp6320.a1-4.dyn; x=1718564184; h=Feedback-ID:
	X-Smtpcorp-Track:Message-ID:Subject:To:From:Date:Reply-To:Sender:
	List-Unsubscribe:List-Unsubscribe-Post;
	bh=6aR9HQaE4Y4lal1GRYEHgr3+/2qU9T5sijRZ4zLk+BE=; b=ST0NvJSatD4uJoIGO7pbievlw7
	f3Bns3M0EYwZTc55xohkaVUy9rJOcGXc+hJsYjgt1v5l/S/IRtKfBz9XENH4anfAWdM6mziY0blkh
	e0wLAdoFnPZoUvo3dkodD3QN7Ttr7zCOxcmu+VjAGozthGCuttOqjxvkq8wToPfESG/KaSL1itAAk
	VeGQ4LyrG84Pud3XnOfBp0am67pBVzbUPPQ/PhJ8tddHUdt7/8Lvv2MFkBdEuGN7mUh7XJwLF3xCs
	J1L5lzOFlT0RywY1qN1uNmNP8rx9ASfF0EH45AsoK75kqvvsglAL6+/hRKTv7mKO2KgthFMswliKj
	GIBevsVA==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fjasle.eu;
 i=@fjasle.eu; q=dns/txt; s=s1174286; t=1718563284; h=from : subject :
 to : message-id : date;
 bh=6aR9HQaE4Y4lal1GRYEHgr3+/2qU9T5sijRZ4zLk+BE=;
 b=k37ZOcr4bx8jxqYeBGDHo5wXGNRUvf7hdG5j1nDU8CB8GwpUUfMwy8iMewq6SxP/SWkde
 BvFWDauQVDi0W69NCHnrRLlVkoV8MwHOleFQiMW5mVd8nk+8bgMC8+IbwB3m+TpwAhIvlgq
 sfTtabMC4rxYOm/q0aIdu/OIx/u6QcPsHNSmHfkTpilPRwZnJPvFo2hTfOGgxhVlVZJinxv
 BMnY1ytennAvo781KnAnkCOGcIfs46ObNnnrh1sYLJXabuaaV9L/AYT/5+i1HndAPVvrNKd
 3ehFD2K7m2jJIGdeybp2qgMWajZZF7JMGzMzMYTFpARkGvBjh0hLI4GBC4ug==
Received: from [10.139.162.187] (helo=SmtpCorp) by smtpcorp.com with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.94.2-S2G) (envelope-from <nicolas@fjasle.eu>)
 id 1sIuoF-TRk2RG-VL; Sun, 16 Jun 2024 18:41:01 +0000
Received: from [10.85.249.164] (helo=leknes.fjasle.eu)
 by smtpcorp.com with esmtpsa
 (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.97.1-S2G) (envelope-from <nicolas@fjasle.eu>)
 id 1sIuoG-4o5NDgrtfVC-lgmk; Sun, 16 Jun 2024 18:41:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fjasle.eu; s=mail;
 t=1718563258; bh=6ACv2bY6r0zfKilkhSR0qAqUlb4hMLiS2w9z7El4auw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=J6yFXe9o80kwHORoqDUYJUjUXOIB2T0JZU+1hrjlCggInbSSj76zFt0mJYNG8d655
 qes3jWF/ztIRn2i/W0ufP3wom/j2F7nRLK020WWZ9isrywROjKpqI8v/PuR8/DDTuZ
 GfW+rDSKQ47psKzI2BDvlqSaa0FUcPg9/3zD4ZAE=
Received: by leknes.fjasle.eu (Postfix, from userid 1000)
 id 365EC3E724; Sun, 16 Jun 2024 20:40:57 +0200 (CEST)
Date: Sun, 16 Jun 2024 20:40:57 +0200
From: Nicolas Schier <nicolas@fjasle.eu>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH 2/2] kbuild: package: add -e and -u options to shell
 scripts
Message-ID: <Zm8xuTWFx6SRAAHk@fjasle.eu>
References: <20240611160938.3511096-1-masahiroy@kernel.org>
 <20240611160938.3511096-2-masahiroy@kernel.org>
 <CAK7LNAQyPRKes7=wNtYXre+nU=5-1oZ-g1uzbjFMFd2e10jFjA@mail.gmail.com>
 <20240616-dandelion-lynx-of-philosophy-6be45f@lindesnes>
 <CAK7LNARPP_OsaOhUHT+5-vi5XJ36hDs0bNsiM7pwuAmj4S+MNg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK7LNARPP_OsaOhUHT+5-vi5XJ36hDs0bNsiM7pwuAmj4S+MNg@mail.gmail.com>
X-Smtpcorp-Track: 17n_Z70jr4vc.zGSjvQePnzKY.OQnRRQreb51
Feedback-ID: 1174286m:1174286a9YXZ7r:1174286sxlsKb0eUo
X-Report-Abuse: Please forward a copy of this message, including all headers,
 to <abuse-report@smtp2go.com>

On Mon, Jun 17, 2024 at 01:52:23AM +0900 Masahiro Yamada wrote:
> On Mon, Jun 17, 2024 at 12:56 AM Nicolas Schier <nicolas@fjasle.eu> wrote:
> >
> > On Mon, Jun 17, 2024 at 12:21:15AM +0900, Masahiro Yamada wrote:
> > > On Wed, Jun 12, 2024 at 1:09 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
> > > >
> > > > Set -e to make these scripts fail on the first error.
> > > >
> > > > Set -u because these scripts are invoked by Makefile, and do not work
> > > > properly without necessary variables defined.
> > > >
> > > > Remove the explicit "test -n ..." from scripts/package/install-extmod-build.
> > > >
> > > > Both options are described in POSIX. [1]
> > > >
> > > > [1]: https://pubs.opengroup.org/onlinepubs/009604499/utilities/set.html
> > > >
> > > > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> > > > ---
> > >
> > >
> > >
> > > Setting -u needs more careful review and test.
> > >
> > >
> > > This patch will break 'make deb-pkg'.
> > >
> > >
> > > ./scripts/package/mkdebian: 150: KDEB_PKGVERSION: parameter not set
> > >
> > >
> > >
> > >
> > > To set -u, scripts/package/mkdebian needs code refactoring.
> > >
> > >
> > >
> > > I will keep scripts/package/mkdebian untouched.
> >
> > uh, I missed that during the review.  Do you want to refactor mkdebian
> > in large scale, or is an explicit fallback definition possibly
> > acceptable for you?
> >
> > diff --git a/scripts/package/mkdebian b/scripts/package/mkdebian
> > index ecfeb34b99aa..7e3878197041 100755
> > --- a/scripts/package/mkdebian
> > +++ b/scripts/package/mkdebian
> > @@ -7,5 +7,17 @@
> >  set -eu
> >
> > +# Optional user-specified environment variables
> > +
> > +# Set target Debian architecture (skip auto-detection)
> > +: "${KBUILD_DEBARCH:=}"
> > +
> > +# Set target Debian distribution (skipping auto-detection)
> > +: "${KDEB_CHANGELOG_DIST:=}"
> > +
> > +# Overwrite the automatically determined package version.
> > +: ${KDEB_PKGVERSION:=}
> > +
> > +
> >  is_enabled() {
> >         grep -q "^$1=y" include/config/auto.conf
> >  }
> >
> 
> 
> 
> 
> It depends on the code.
> 
> 
> 
> 
> I would fix
> 
> 
>    if [ -n "$KDEB_PKGVERSION" ]; then
> 
> 
> to
> 
>    if [ "${KDEB_PKGVERSION:+set}" = set ]; then
> 
> or
>    if [ "${KDEB_PKGVERSION:+set}" ]; then


ah, yes that's probaly better than the default value assigments,  Please ignore
my patch.

Kind regards,
Nicolas

