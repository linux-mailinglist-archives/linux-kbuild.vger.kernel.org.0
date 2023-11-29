Return-Path: <linux-kbuild+bounces-190-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CEB87FCD8A
	for <lists+linux-kbuild@lfdr.de>; Wed, 29 Nov 2023 04:40:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 573E01C20748
	for <lists+linux-kbuild@lfdr.de>; Wed, 29 Nov 2023 03:40:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67AF95690;
	Wed, 29 Nov 2023 03:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="v5TF0+LN"
X-Original-To: linux-kbuild@vger.kernel.org
X-Greylist: delayed 2121 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 28 Nov 2023 19:40:07 PST
Received: from master.debian.org (master.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4001])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E6431AD;
	Tue, 28 Nov 2023 19:40:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.master; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-ID:Content-Description;
	bh=sfSRZz+tS/jgANowDisFfaKV4+KVzpwYgUqmEwwZxuw=; b=v5TF0+LNwHfL76OBlQ5vagPgWg
	PfJeZ9p1jv3lRHH7rB02doABPNJL0L3CC59HvJoScpjfo6cEs8h46ewWikRk5VFySq6Ju6nMhkkbu
	EUvmAWKkU3WAxJb/rDu40uFJygcWPq62wNRrWkkzyabAmyYKN8iRXpAXcQ/LLHHWgcOFcZ+nCi61L
	AybG5gg4dYJwhZAm+luDzm58GlGaEwuBsbQXAajw87jwJ00ltEDSYr3xgsx6lFKsFcfUh5TIunpOk
	VxKFhpQFHv2dIHXzX0kPJBdBABabZ/1mZJIJOxJHdCpvxii1llzBAMYu6TH761wxPMpW4xze5/bn1
	r0VeHpdg==;
Received: from guillem by master.debian.org with local (Exim 4.94.2)
	(envelope-from <guillem@master.debian.org>)
	id 1r8AsN-00GS5r-I6; Wed, 29 Nov 2023 03:04:35 +0000
Date: Wed, 29 Nov 2023 04:04:33 +0100
From: Guillem Jover <guillem@debian.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, Ben Hutchings <ben@decadent.org.uk>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nicolas Schier <nicolas@fjasle.eu>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] kbuild: deb-pkg: remove the fakeroot builds support
Message-ID: <ZWaqQeR8Rcx-0b4Y@thunder.hadrons.org>
Mail-Followup-To: Guillem Jover <guillem@debian.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	linux-kbuild@vger.kernel.org, Ben Hutchings <ben@decadent.org.uk>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nicolas Schier <nicolas@fjasle.eu>, linux-kernel@vger.kernel.org
References: <20231128235356.527642-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231128235356.527642-1-masahiroy@kernel.org>

Hi!

On Wed, 2023-11-29 at 08:53:56 +0900, Masahiro Yamada wrote:
> In 2017, the dpkg suite introduced the rootless builds support with the
> following commits:
> 
>   - 2436807c87b0 ("dpkg-deb: Add support for rootless builds")
>   - fca1bfe84068 ("dpkg-buildpackage: Add support for rootless builds")
> 
> This feature is available in the default dpkg on Debian 10 and Ubuntu
> 20.04.
> 
> Remove the old method.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
> Changes in v3:
>   - Remove DEB_RULES_REQUIRES_ROOT=no again
>     (resent in order to clarify which one should be applied)

Thanks, as this variable is supposed to be defined by the build driver
(such as dpkg-buildpackage) that calls debian/rules, as covered in the
rootless-builds.txt spec.

> diff --git a/scripts/Makefile.package b/scripts/Makefile.package
> index 0c3adc48dfe8..a81dfb1f5181 100644
> --- a/scripts/Makefile.package
> +++ b/scripts/Makefile.package
> @@ -109,8 +109,6 @@ debian-orig: linux.tar$(debian-orig-suffix) debian
>  		cp $< ../$(orig-name); \
>  	fi
>  
> -KBUILD_PKG_ROOTCMD ?= 'fakeroot -u'
> -
>  PHONY += deb-pkg srcdeb-pkg bindeb-pkg
>  
>  deb-pkg:    private build-type := source,binary
> @@ -125,7 +123,7 @@ deb-pkg srcdeb-pkg bindeb-pkg:
>  	$(if $(findstring source, $(build-type)), \
>  		--unsigned-source --compression=$(KDEB_SOURCE_COMPRESS)) \
>  	$(if $(findstring binary, $(build-type)), \
> -		-R'$(MAKE) -f debian/rules' -j1 -r$(KBUILD_PKG_ROOTCMD) -a$$(cat debian/arch), \
> +		-R'$(MAKE) -f debian/rules' -j1 -a$$(cat debian/arch), \

Since dpkg 1.14.7, dpkg-buildpackage uses fakeroot if available, so
regardless of anything else this removal seems safe.

>  		--no-check-builddeps) \
>  	$(DPKG_FLAGS))
>  
> diff --git a/scripts/package/builddeb b/scripts/package/builddeb
> index d7dd0d04c70c..2fe51e6919da 100755
> --- a/scripts/package/builddeb
> +++ b/scripts/package/builddeb
> @@ -36,19 +36,13 @@ create_package() {
>  	sh -c "cd '$pdir'; find . -type f ! -path './DEBIAN/*' -printf '%P\0' \
>  		| xargs -r0 md5sum > DEBIAN/md5sums"
>  
> -	# Fix ownership and permissions
> -	if [ "$DEB_RULES_REQUIRES_ROOT" = "no" ]; then
> -		dpkg_deb_opts="--root-owner-group"
> -	else
> -		chown -R root:root "$pdir"
> -	fi
>  	# a+rX in case we are in a restrictive umask environment like 0077
>  	# ug-s in case we build in a setuid/setgid directory
>  	chmod -R go-w,a+rX,ug-s "$pdir"
>  
>  	# Create the package
>  	dpkg-gencontrol -p$pname -P"$pdir"
> -	dpkg-deb $dpkg_deb_opts ${KDEB_COMPRESS:+-Z$KDEB_COMPRESS} --build "$pdir" ..
> +	dpkg-deb --root-owner-group ${KDEB_COMPRESS:+-Z$KDEB_COMPRESS} --build "$pdir" ..

If you want to make sure dpkg-deb supports that option, perhaps add
«dpkg (>= 1.19.0)» to the package Build-Depends? If that version seems
old enough to be assumed to be present, then unconditionally using it
seems fine.

>  }
>  
>  install_linux_image () {

Otherwise, the change LGTM.

Thanks,
Guillem

