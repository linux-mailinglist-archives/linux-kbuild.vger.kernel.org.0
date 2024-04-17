Return-Path: <linux-kbuild+bounces-1594-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C9DB68A7B6D
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Apr 2024 06:37:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0692C1C2172C
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Apr 2024 04:37:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4770C1D530;
	Wed, 17 Apr 2024 04:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thefossguy.com header.i=@thefossguy.com header.b="b1yIZsvZ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-4022.proton.ch (mail-4022.proton.ch [185.70.40.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC3828475;
	Wed, 17 Apr 2024 04:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.40.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713328668; cv=none; b=rIqEpuLiP0+9jh5lz5iuFv+OeevokK5z5gdQHl14b6XS3ne2mKO2n2eW5jm1kXY6vGJhyNgzQTunNamdXcCFfvjszSmOEMBwItIHxAYQ3zl+cQNhGQ6GTLTTqZdi6chazZBV46Fob/gRPqs4t6UkgZb9kJ1tmiKmF4U/Nr3WJQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713328668; c=relaxed/simple;
	bh=qbDz0DlgjrZENhlsJHJ+gy7SCfIWG/XwWh12SVY1HZk=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=FREJ1O13aFRR1J9VlZjBeZuJKhJVgnslpSsK0SugFg6rw+2deyco0n+NHdoxkfz/5dQVtniCOWIKFxxMf8bFPWx1sFnoAdxWMEE3KAxI2v9/+irVEvMfM8sIutOpMoN8WbaVDoFtYTySEVzxQ/Fl6wv/wU3A2IpMlwHWfEOceEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thefossguy.com; spf=pass smtp.mailfrom=thefossguy.com; dkim=pass (2048-bit key) header.d=thefossguy.com header.i=@thefossguy.com header.b=b1yIZsvZ; arc=none smtp.client-ip=185.70.40.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thefossguy.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thefossguy.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thefossguy.com;
	s=protonmail; t=1713328657; x=1713587857;
	bh=IbZR0E8/N9KY9oYmAUshTasIKbqaTz9GcGXb+f2i2D4=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=b1yIZsvZtUtDn2depEJGgUVQLugYpxmY7Pm7bJV2lVoh/lpKxIseLcWaWN5ByL8cz
	 FwmHpX6pBXbVTjHAXMyXnWsY+kUN1WXBQoiYcYjCY5HCaQOyXJbVDp2pzpIRHSWRsa
	 XwpU+gNRKFH4wiEK4kWmMEHc1SAzkNhHSzXNmCUOPkklFEgxbulN8mag3LimhgGP68
	 vbbbaA906d5DlpA+FmK7mNBUgdaM8gEQcv7lo/BHHOsDsPcD7EaatXhfNgBw9074ue
	 q3O5pVN55WZ+4Pajwkomg+AVxsvPqhu4dQ/dlaPW7dQJhVYLJ32g/wQdQ3DqAqONLE
	 MstFI19XH0MoA==
Date: Wed, 17 Apr 2024 04:37:32 +0000
To: Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, Jonathan Corbet <corbet@lwn.net>
From: Pratham Patel <prathampatel@thefossguy.com>
Cc: linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Pratham Patel <prathampatel@thefossguy.com>, thefirst1322@gmail.com
Subject: [PATCH 0/2] Enable building of the devel RPM package from Kbuild
Message-ID: <20240417043654.60662-1-prathampatel@thefossguy.com>
Feedback-ID: 104309535:user:proton
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

This addresses a minor nit where I want a `-devel` RPM package to be
built when I build a binary RPM package with either `binrpm-pkg`
or `rpm-pkg` target(s).

Pratham Patel (2):
  kbuild: allow toggling the `with_devel` RPM macro
  docs: kbuild: document KBUILD_RPM_WITH_DEVEL

 Documentation/kbuild/kbuild.rst | 6 ++++++
 scripts/Makefile.package        | 5 ++++-
 2 files changed, 10 insertions(+), 1 deletion(-)

--
2.42.0


