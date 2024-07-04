Return-Path: <linux-kbuild+bounces-2341-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E05692730F
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Jul 2024 11:29:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0A166288A3C
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Jul 2024 09:29:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27DE61ABC31;
	Thu,  4 Jul 2024 09:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b="kRjyWWuP"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no [194.63.252.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1581B1AB503;
	Thu,  4 Jul 2024 09:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.63.252.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720085348; cv=none; b=AeEQfkvqUarm8n5vNy0QYOhzSHJT//1UDPB295cfBfeRhVSuvaTa0g7jixmIfwUyDyl3pokBnrRKoPfMXWBJBjq0Hj8YBI+t8a65VUQy0Kzl+k9hiEpagjeF1ie2TTDjmT+ya/BmFHIFbIIazE5DGk5+5G5jekDz6vz4pAl6TPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720085348; c=relaxed/simple;
	bh=JDTNdtJ9EjeVWEDYTvfOUcNAXPH8Vd9Rhq0lQHPhMQ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D33MZ8KbcjD3NkCpEzT923dphfoWAVajCvpgQMxwsRGnXv8no51t+1yYv7/xjHKO9RWMjWNqYhGL2WazDF7wNkZ6VhTiVEXqoZRsQNdeL3Q2gjU2z8h+WColSRddhqMnJ9FTfbJ2AQhG1Lk7WcUYcNgGM/tRK0rxvnjwcv7isWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu; spf=pass smtp.mailfrom=fjasle.eu; dkim=pass (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b=kRjyWWuP; arc=none smtp.client-ip=194.63.252.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fjasle.eu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=fjasle.eu;
	s=ds202307; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=DyhZ1iiyVfmixs11acANLVksd56ZyeYAxvhyNmQKIEg=; b=kRjyWWuPokEiKl8Bvt6Fxjj9kc
	d87O+HpRNTplQZpbC2VmmSEbFE3Z3+iFDm3CNz6SwebtLm7Iu6uiUSGc7L+X2C4i832aOnr330ZzH
	bSb7VrVgxRN6uxhVhexKI2c5EqsJn+sH1RmRWueMOeEQcuekrRXVmTENvfcPL2up+1yi7Hr7UWPge
	NjxE4U6/s0YFGDopxMEi83OF3y9vkxLrVfKb1QaxHLKORa8tJ+TmoQwQD67kAQhmPcjpB7WTOjQJP
	CqD7ENgBuxJFxuxSJMb/BmDnND1rr2sCa6qNPOH8NKq08HHuoZdOKITDS7lTB3Rq3nR2pkDOb1b/Z
	wCeI6D1A==;
Received: from [2001:9e8:9da:801:3235:adff:fed0:37e6] (port=34396 helo=lindesnes.fjasle.eu)
	by smtp.domeneshop.no with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <nicolas@fjasle.eu>)
	id 1sPIlu-006gwG-Ae;
	Thu, 04 Jul 2024 11:28:58 +0200
Date: Thu, 4 Jul 2024 11:28:52 +0200
From: Nicolas Schier <nicolas@fjasle.eu>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>, riku.voipio@iki.fi,
	Ben Hutchings <ben@decadent.org.uk>
Subject: Re: [PATCH v2 2/3] kbuild: deb-pkg: remove support for "name
 <email>" form for DEBEMAIL
Message-ID: <20240704-defiant-gopher-from-mars-7c0ae8@lindesnes>
References: <20240702180332.398978-1-masahiroy@kernel.org>
 <20240702180332.398978-2-masahiroy@kernel.org>
 <CAK7LNASQvNVq_hrbZo3SXoFvke3EENVC6tfxiN11dOk4O54C6w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK7LNASQvNVq_hrbZo3SXoFvke3EENVC6tfxiN11dOk4O54C6w@mail.gmail.com>

On Thu, Jul 04, 2024 at 12:06:13AM +0900, Masahiro Yamada wrote:
> +CC
> 
> 
> 
> On Wed, Jul 3, 2024 at 3:03 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
> >
> > Commit d5940c60e057 ("kbuild: deb-pkg improve maintainer address
> > generation") supported the "name <email>" form for DEBEMAIL, with
> > behavior slightly different from devscripts.
> >
> > In Kbuild, if DEBEMAIL has the form "name <email>", it will be used
> > as-is for debian/changelog. DEBFULLNAME will be ignored.
> >
> > In contrast, debchange takes the name from DEBFULLNAME (or NAME) if set,
> > as described in 'man debchange':
> >
> >   If this variable has the form "name <email>", then the maintainer name
> >   will also be taken from here if neither DEBFULLNAME nor NAME is set.
> >
> > This commit removes support for the "name <email> form for DEBEMAIL,
> > as the current behavior is already different from debchange, and the
> > Debian manual suggests setting the email address and name separately in
> > DEBEMAIL and DEBFULLNAME. [1]
> >
> > If there are any complaints about this removal, we can re-add it,
> > with better alignment with the debchange implementation. [2]
> >
> > [1]: https://www.debian.org/doc/manuals/debmake-doc/ch03.en.html#email-setup
> > [2]: https://salsa.debian.org/debian/devscripts/-/blob/v2.23.7/scripts/debchange.pl#L802
> >
> > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> > ---
> >
> > Changes in v2:
> >  - New patch
> >
> >  scripts/package/mkdebian | 20 +++++++-------------
> >  1 file changed, 7 insertions(+), 13 deletions(-)
> >
> > diff --git a/scripts/package/mkdebian b/scripts/package/mkdebian
> > index 589f92b88c42..83c6636fadb8 100755
> > --- a/scripts/package/mkdebian
> > +++ b/scripts/package/mkdebian
> > @@ -125,21 +125,15 @@ gen_source ()
> >  rm -rf debian
> >  mkdir debian
> >
> > -email=${DEBEMAIL}
> > -
> > -# use email string directly if it contains <email>
> > -if echo "${email}" | grep -q '<.*>'; then
> > -       maintainer=${email}
> > +user=${KBUILD_BUILD_USER-$(id -nu)}
> > +name=${DEBFULLNAME-${user}}
> > +if [ "${DEBEMAIL:+set}" ]; then
> > +       email=${DEBEMAIL}
> >  else
> > -       # or construct the maintainer string
> > -       user=${KBUILD_BUILD_USER-$(id -nu)}
> > -       name=${DEBFULLNAME-${user}}
> > -       if [ -z "${email}" ]; then
> > -               buildhost=${KBUILD_BUILD_HOST-$(hostname -f 2>/dev/null || hostname)}
> > -               email="${user}@${buildhost}"
> > -       fi
> > -       maintainer="${name} <${email}>"
> > +       buildhost=${KBUILD_BUILD_HOST-$(hostname -f 2>/dev/null || hostname)}
> > +       email="${user}@${buildhost}"
> >  fi
> > +maintainer="${name} <${email}>"
> >
> >  if [ "$1" = --need-source ]; then
> >         gen_source
> > --
> > 2.43.0

Reviewed-by: Nicolas Schier <nicolas@fjasle.eu>

