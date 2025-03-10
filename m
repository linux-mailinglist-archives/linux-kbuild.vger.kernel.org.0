Return-Path: <linux-kbuild+bounces-6034-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DCA6A5A375
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Mar 2025 19:55:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BB4883AC245
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Mar 2025 18:55:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12A42230987;
	Mon, 10 Mar 2025 18:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hp.com header.i=@hp.com header.b="U6avsyvL"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from us-smtp-delivery-162.mimecast.com (us-smtp-delivery-162.mimecast.com [170.10.129.162])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CEA42222DF
	for <linux-kbuild@vger.kernel.org>; Mon, 10 Mar 2025 18:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.162
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741632919; cv=none; b=uxCNb2o3+NeEKJB7zBkX2NKOvASrEa6Y8+t+eJo+Bu+E7O/8gro3ccyRo5jM2psEKl+4hOgwrj2OHJe4P8JSq+kCP6o00d/qo+/aG1ixbTXwZcF9+vWxq2tnKFv3Q/ucwybe79lSflWwHK1HDm/LHMXN46txaWQLtYFF/vY4v9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741632919; c=relaxed/simple;
	bh=7ookYLrNwrNtolfzFvPur19JqZSBzO+XPKJeVceqMr0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Disposition; b=p8wsLYK4q1ZIz8sG4iSVFn2KhHD0hkGYeC+AzmPcmvtyiAlPLaRTPxLb7KyDnWWyEdbnSatzB8c9jw5hZeTMc5lrdZKySQ7jsyxTsjhp3HNpRd83F3yrfClOR4uDb7AQfDKshZyZ5dUJcwEJkOudHVemL1ucDJeiFrHqSc65AQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hp.com; spf=pass smtp.mailfrom=hp.com; dkim=pass (1024-bit key) header.d=hp.com header.i=@hp.com header.b=U6avsyvL; arc=none smtp.client-ip=170.10.129.162
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hp.com; s=mimecast20180716;
	t=1741632916;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7ookYLrNwrNtolfzFvPur19JqZSBzO+XPKJeVceqMr0=;
	b=U6avsyvLh3XMf77iRqOvgcBKrfjoRI6hNIFmDD7V9poZhHxlz8pwJiROq3HHM9ytXYtGRM
	6Bqlvn/knkTUJG2XeFLwLo8whrQt3KDSfDUnvkdblnfE4MLvYZhbc9srYky42LY7u5rJQD
	mKtieELzV0GALrdQCw6ICxuKnRAibxE=
Received: from g8t13016g.inc.hp.com (hpifallback.mail.core.hp.com
 [15.72.64.134]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-403-BiBXDuYGNGKcKjyGd3neRA-1; Mon, 10 Mar 2025 14:55:13 -0400
X-MC-Unique: BiBXDuYGNGKcKjyGd3neRA-1
X-Mimecast-MFC-AGG-ID: BiBXDuYGNGKcKjyGd3neRA_1741632912
Received: from g8t13021g.inc.hpicorp.net (g8t13021g.inc.hpicorp.net [15.60.27.219])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by g8t13016g.inc.hp.com (Postfix) with ESMTPS id 214466002E61;
	Mon, 10 Mar 2025 18:55:11 +0000 (UTC)
Received: from localhost.localdomain (unknown [15.53.255.151])
	by g8t13021g.inc.hpicorp.net (Postfix) with ESMTP id B57826000324;
	Mon, 10 Mar 2025 18:55:09 +0000 (UTC)
From: Alexandru Gagniuc <alexandru.gagniuc@hp.com>
To: masahiroy@kernel.org,
	nathan@kernel.org,
	linux-kbuild@vger.kernel.org
Cc: nicolas@fjasle.eu,
	linux-kernel@vger.kernel.org,
	Alexandru Gagniuc <alexandru.gagniuc@hp.com>
Subject: Re: [PATCH] kbuild: deb-pkg: don't set KBUILD_BUILD_VERSION indiscriminately
Date: Mon, 10 Mar 2025 18:53:06 +0000
Message-ID: <20250310185306.2476022-1-alexandru.gagniuc@hp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250307205612.GA2695746@ax162>
References: <20250305192536.1673099-1-alexandru.gagniuc@hp.com> <Z8sgisZ8FI3wkpfZ@fjasle.eu> <20250307205612.GA2695746@ax162>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Mutt-References: <20250307205612.GA2695746@ax162>
X-Mutt-Fcc: ~/sent
Status: RO
Lines: 21
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: XoPwBCdreOzUzrTJZ9S0XttnZBTBZTugNxrjQADpCGQ_1741632912
X-Mimecast-Originator: hp.com
Content-Type: text/plain; charset=WINDOWS-1252
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Nathan and Nicholas,

On Fri, Mar 07, 2025 at 09:56:12PM +0100, Nathan Chancellor wrote:
> On Fri, Mar 07, 2025 at 05:36:26PM +0100, Nicolas Schier wrote:
> > On Wed, Mar 05, 2025 at 07:25:36PM +0000 Alexandru Gagniuc wrote:
> > > Cc: <stable@vger.kernel.org> # v6.12+
> >=20
> > Shouldn't this be v6.8, as 7d4f07d5cb71 got introduced there?
>=20
> Presumably this is because there are no supported kernel versions
> between 6.8 and 6.12 anymore but I think the '# v6.12+' is entirely
> superfluous because there is a fixes tag, so the stable folks will
> figure out how far to backport it automatically based on that.
>=20
I'll just remove the '# v6.12+' then.
> > > Fixes: 7d4f07d5cb71 ("kbuild: deb-pkg: squash scripts/package/deb-bui=
ld-option to debian/rules")

I agree that "unconditionally" better conveys the idea behind the
patch. I'll make that change too.

Alex


