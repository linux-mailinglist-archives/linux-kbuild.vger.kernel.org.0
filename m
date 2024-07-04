Return-Path: <linux-kbuild+bounces-2339-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E3E1F9272FE
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Jul 2024 11:27:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9ED2C28C471
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Jul 2024 09:27:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12B191AAE38;
	Thu,  4 Jul 2024 09:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b="flE9jJl2"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no [194.63.252.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 215391A4F10;
	Thu,  4 Jul 2024 09:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.63.252.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720085221; cv=none; b=bwfJvIoSnMShbyLDPWyk0e39yw3JI46AE+zoWOgOG0xdpCqCoyB9CKN53URcCAhbeBUjyboIr3n+4eb0IBOcjpbJu0kp61r5WKNlAKE1jKFGCI0lOb7uzrptOH4KATEwZfUg6zRGjZ6UHUFNUSJbLCEO6um5FalRXz4pS3e9E2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720085221; c=relaxed/simple;
	bh=F1KfsD3UGvzoMc6T0DbYQti/NUflDGqLSkO0N0b94Ek=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L1bxLAuI14zCsZco0etnkm4zuWK5JIMo/5SZVaFARCwF8pswOASW6Nuy6M8oHJLtnfFx7g88RqocdFM6fIrEe1s50MzXsrRDHB5AobRfNXkYvXt2ARwbwD/7PfwstnTGMbTD/rFgWfFRYrgFjQYpF/6mlIfKD/qbrRCuTr0wPMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu; spf=pass smtp.mailfrom=fjasle.eu; dkim=pass (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b=flE9jJl2; arc=none smtp.client-ip=194.63.252.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fjasle.eu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=fjasle.eu;
	s=ds202307; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=2lguWEUjpKlrDoi2fLaNoUIl9vpd9WgCM2kNC4wH6Yw=; b=flE9jJl2aWecCqgjHzWRQ3gyBv
	WqR15/1yY3x+YTlm5k4lTIIMWeel84Y+l/A8zbncvTu1w4Gw63SxJrZNKfsJOTlSQrF40aXAqI/Ro
	Nui0sg1Z47pBX4hPoZUWWzIFw+A+gvheghoasORhFz6sZnM++IYUq2hsTXvuZgSGT+e5W3Bhq1rgR
	cIwqBuL8vu5eMzgIcaCSoru5EeIufzGpf8kKBOxD+rUZ9COaGXX7KualwetqpRBAljZ5BaJ8S9Ktm
	rUupaKV+rXwRthNo3/FvEWIJdR38R87LMP2utYWjvg3RRMAzP628X2WEABEfm0QJJ2lD1XsG3djr/
	3qEjBqOA==;
Received: from [2001:9e8:9da:801:3235:adff:fed0:37e6] (port=54722 helo=lindesnes.fjasle.eu)
	by smtp.domeneshop.no with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <nicolas@fjasle.eu>)
	id 1sPIjp-006g3V-IA;
	Thu, 04 Jul 2024 11:26:49 +0200
Date: Thu, 4 Jul 2024 11:26:46 +0200
From: Nicolas Schier <nicolas@fjasle.eu>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>,
	Riku Voipio <riku.voipio@linaro.org>,
	Ben Hutchings <ben@decadent.org.uk>
Subject: Re: [PATCH v2 1/3] kbuild: deb-pkg: remove support for EMAIL
 environment variable
Message-ID: <20240704-able-honeybee-of-symmetry-ddfcdd@lindesnes>
References: <20240702180332.398978-1-masahiroy@kernel.org>
 <CAK7LNAS1jz51ytG1fu3tvUp-iNYk8UzwE+q5ioS1TP0tM7Phkg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK7LNAS1jz51ytG1fu3tvUp-iNYk8UzwE+q5ioS1TP0tM7Phkg@mail.gmail.com>

On Wed, Jul 03, 2024 at 11:57:44PM +0900, Masahiro Yamada wrote:
> (+CC more Debian developers)
> 
> 
> On Wed, Jul 3, 2024 at 3:03 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
> >
> > Commit edec611db047 ("kbuild, deb-pkg: improve maintainer
> > identification") added the EMAIL and NAME environment variables.
> >
> > Commit d5940c60e057 ("kbuild: deb-pkg improve maintainer address
> > generation") removed support for NAME, but kept support for EMAIL.
> >
> > The EMAIL and NAME environment variables are still supported by some
> > tools (see 'man debchange'), but not by all.
> >
> > We should support both of them, or neither of them. We should not stop
> > halfway.
> >
> > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> > ---
> >
> > Changes in v2:
> >  - New patch
> >
> >  scripts/package/mkdebian | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/scripts/package/mkdebian b/scripts/package/mkdebian
> > index b9a5b789c655..589f92b88c42 100755
> > --- a/scripts/package/mkdebian
> > +++ b/scripts/package/mkdebian
> > @@ -125,7 +125,7 @@ gen_source ()
> >  rm -rf debian
> >  mkdir debian
> >
> > -email=${DEBEMAIL-$EMAIL}
> > +email=${DEBEMAIL}
> >
> >  # use email string directly if it contains <email>
> >  if echo "${email}" | grep -q '<.*>'; then
> > --
> > 2.43.0

Reviewed-by: Nicolas Schier <nicolas@fjasle.eu>

