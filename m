Return-Path: <linux-kbuild+bounces-1825-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF68A8C30CE
	for <lists+linux-kbuild@lfdr.de>; Sat, 11 May 2024 13:18:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BF4621C209D6
	for <lists+linux-kbuild@lfdr.de>; Sat, 11 May 2024 11:18:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFD015381B;
	Sat, 11 May 2024 11:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lw7Z+Y6A"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D76F4D9FB;
	Sat, 11 May 2024 11:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715426323; cv=none; b=GwNu3sw8PoqFYHqqW52bQ39pDy44A1cDv9UQym3g3Y60jdyGKy7SQY0QnLMQ101qKEVqWy20ga4T0VBqPFnBn3Ngup4I37p/Wp4K0nsMnVyHk1WNeevDDb+c3jhLRo8HZByz9m6cd+L3f+0fdtv7+etb0VK8HjMxdUbG32tadN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715426323; c=relaxed/simple;
	bh=ZTVjt+ReLC+AsdLyTd8BgDeJArPI1QN8Y6ITsJ/HDjg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nPIHNUh+grcnGvpbp3l59TeoPWW3C38wl3t66Niefb09yvb1qps20JFu8Y2GtMr/KauAD8Q01K+2zOcoP53V6lajqdI0oaN7+xnfVY4V0+Wr5IXgwRVn1mCuqnai+1IryssCJqg3gIHqFHTrSfUtIfmw1/WE6wXbidmlnsSjfGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lw7Z+Y6A; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1ed012c1afbso23066575ad.1;
        Sat, 11 May 2024 04:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715426322; x=1716031122; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZTVjt+ReLC+AsdLyTd8BgDeJArPI1QN8Y6ITsJ/HDjg=;
        b=lw7Z+Y6As7O4LAiet0Ed5uV036IU5pJimXVO55vlnIWJ22eJVdz9mpst+ZDIB31MSd
         0V9sZN8sPW25IUlgEFU9T+qaReT2+9y4FGqAEPqdhF40XM3w/jspQhaRmLYW1reA5RpU
         AddprYFYJoqfGz8xieIxD27/TrkP89p4P3AhWHyXJCu1RbwKzBRcvA+MXSZMg2ciuTLG
         1q6eDcZR/xafxIrXpswb1GKMylT+ZMH8LqK1PX14yz+CYDstPTjetRW4rF8SIizKUajG
         XUAOVloMpWQEC14Rot0LvFgoxYymGbZDfWdxmQXXDLhbm8uxIjye/V45IeY3imzO9Tz9
         EVKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715426322; x=1716031122;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZTVjt+ReLC+AsdLyTd8BgDeJArPI1QN8Y6ITsJ/HDjg=;
        b=pQoaGjtsIkTBCTFi4AhmxXkqo38FTr6oFXMQqmy8/3tJejlu0NePqKJ5AXlngfJBsW
         4w5A1cY8RUI8kftKtNl2FqtfEqXuj6OnKJUOGvoyqKXkVJWK4X18CqerGGymt2jPypeR
         VCQhMldzwANpotCI2NXtKKISIUXEpR8lvgmehxUbEEnbLOH1SRLAtgGABJPQj+jqx+XF
         m0ClECUaZiCh/PiJjr2gzEtQ1SwGFTKWRJKns7HNLOXXOb1Dv+YK1bsPxne0KCkYvWgX
         94lgR7uKUy/lNG60GKVkoiZMuEvaocKDo4CmYS7NtoMCDS+9V2sPunthhfby0P1siieQ
         8Xsg==
X-Forwarded-Encrypted: i=1; AJvYcCX5A3KdvCGSlnPQIQygB+s1zROgqIfad+LXXD6xg5lJSK4PSzPNwKej27O5yvlBVpfpqtU4eHZw2qO7OPyC0qU4iGkA52rCqum2vbK3
X-Gm-Message-State: AOJu0YzNx3ynw5alGESwRkUvoMyQT95XKS/rY8Qbgbh+qls1JhpbsjcI
	vBeulyMRp/5/KXl7zXOm0H6vPhouEOy78CFp9Ru5Jday+3z3tg1z
X-Google-Smtp-Source: AGHT+IH/ZEpCrYYVxPQPfZNlNLdiQv293EYCmdtdYMcQYmkPBuRiL/IZ91KAbDYgDN1wJZtS0MJ+tw==
X-Received: by 2002:a17:903:1cf:b0:1e7:b6f4:2d77 with SMTP id d9443c01a7336-1ef4318d7aamr68154285ad.22.1715426321708;
        Sat, 11 May 2024 04:18:41 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0bae9d09sm47176905ad.119.2024.05.11.04.18.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 May 2024 04:18:41 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id B49DE181FC622; Sat, 11 May 2024 18:18:38 +0700 (WIB)
Date: Sat, 11 May 2024 18:18:38 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Kernel Build System <linux-kbuild@vger.kernel.org>
Cc: Sami Tolvanen <samitolvanen@google.com>,
	Kees Cook <keescook@chromium.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Xu Zhen <xuzhen@fastmail.com>
Subject: Fwd: Incorrect thinlto cache directory path in Makefile
Message-ID: <Zj9UDiAHqX3noTsy@archie.me>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hvHleVGfPEbZBFqD"
Content-Disposition: inline


--hvHleVGfPEbZBFqD
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

Xu Zhen <xuzhen@fastmail.com> reported on Bugzilla (https://bugzilla.kernel=
=2Eorg/show_bug.cgi?id=3D218825) thinlto build directory problem (especiall=
y on
DKMS modules). He wrote:

> In Makefile, the ld flag `--thinlto-cache-dir' is set to
> `$(extmod_prefix).thinlto-cache'. But at that time, the variable extmod_p=
refix
> had not been assigned yet. Therefore, the thinlto cache dir is always cre=
ated
> in the current directory.
>=20
> Even worse, the cache dir cannot be deleted when executing `make clean'. =
This
> is because its path was written as `$(KBUILD_EXTMOD)/.thinlto-cache' in t=
he
> clean: target.
>=20
> Some users have been troubled by it: https://github.com/dell/dkms/issues/=
292
>=20
> This bug was introduced by commit dc5723b02e523b2c4a68667f7e28c65018f7202f

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--hvHleVGfPEbZBFqD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZj9UCAAKCRD2uYlJVVFO
o+joAQDEeSJZ9MQqSgMq9VrowDQyslrDGOS3Ao0Ams995iBjWwEAoFLnO3v6bpB1
Ij3UAqQrVp443gHQVkZh7BnktFni0gU=
=+Bm5
-----END PGP SIGNATURE-----

--hvHleVGfPEbZBFqD--

