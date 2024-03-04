Return-Path: <linux-kbuild+bounces-1146-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4654D86FE0A
	for <lists+linux-kbuild@lfdr.de>; Mon,  4 Mar 2024 10:52:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0285428158F
	for <lists+linux-kbuild@lfdr.de>; Mon,  4 Mar 2024 09:52:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98232225A2;
	Mon,  4 Mar 2024 09:51:02 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail.avm.de (mail.avm.de [212.42.244.94])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BE9F241E5
	for <linux-kbuild@vger.kernel.org>; Mon,  4 Mar 2024 09:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.42.244.94
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709545862; cv=none; b=OjKDu0V6G81zUMCJ080vLG1ZRLkQSGqWAx6uUlvO7j+KDFYdjpFr136ITFRSPhuaKnW96Eu/2JPFELJVgHX0TM64ASgPnii5iTHzl5Hjxrx2JWPMbGkshXPXmH6BLA9iaIHuzdT1Jh7aW6j/L6/Mtwf4a6ZQEemBmxavDTWZU20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709545862; c=relaxed/simple;
	bh=Ba1q4bnAD5Lx6lvd8PC3jksuZQuAs3fuic3jdgL7DQs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hbYKR+C25sZi9Aj8RsIKzlgYzCWnsUDiEjV1EszzGPVVM01WQuEbONkNWrVdZsqdQqW1PD8nGK+wIJff0lbiogC2FtIgGviMyoeQfB/DJl/TlQkIjjK3riaLulkRr5rhFR/2esTixcj72t+a83+7ze6DRgVrMUwM9EzW71tE8OM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=fjasle.eu; spf=pass smtp.mailfrom=avm.de; arc=none smtp.client-ip=212.42.244.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=fjasle.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=avm.de
Received: from mail-auth.avm.de (unknown [IPv6:2001:bf0:244:244::71])
	by mail.avm.de (Postfix) with ESMTPS;
	Mon,  4 Mar 2024 10:50:49 +0100 (CET)
Received: from buildd.core.avm.de (buildd-sv-01.avm.de [172.16.0.225])
	by mail-auth.avm.de (Postfix) with ESMTPA id 32FCB80152;
	Mon,  4 Mar 2024 10:50:49 +0100 (CET)
Received: by buildd.core.avm.de (Postfix, from userid 1000)
	id 286B5180C38; Mon,  4 Mar 2024 10:50:49 +0100 (CET)
Date: Mon, 4 Mar 2024 10:50:49 +0100
From: Nicolas Schier <nicolas@fjasle.eu>
To: Elliott Mitchell <ehem+linux@m5p.com>
Cc: masahiroy@kernel.org, nathan@kernel.org, linux-kbuild@vger.kernel.org
Subject: Re: [WIP PATCH 01/30] build: replace uses of $(abspath ) with
 existing variables
Message-ID: <ZeWZebwyvtuJ6Xd1@buildd.core.avm.de>
References: <cover.1709508290.git.ehem+linux@m5p.com>
 <2173c7fa03e24291f2f59423d77a3cb175317688.1709508290.git.ehem+linux@m5p.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <2173c7fa03e24291f2f59423d77a3cb175317688.1709508290.git.ehem+linux@m5p.com>
X-purgate-ID: 149429::1709545849-275F89CD-85275499/0/0
X-purgate-type: clean
X-purgate-size: 639
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for further information)
X-purgate: clean

On Fri, Mar 01, 2024 at 12:51:01PM -0800, Elliott Mitchell wrote:
> As $(abs_objtree) and $(abs_srctree) already exist, $(abspath )
> shouldn't be used with $(objtree) or $(srctree).
>=20
> Fixes: 0e1aa629f1ce ("kbuild: Do not clean resolve_btfids if the output d=
oes not exist")
> Signed-off-by: Elliott Mitchell <ehem+linux@m5p.com>
> ---
> I believe this is pretty much all fixes, but 0e1aa629f1ce was the most
> recent one.

If you add a 'Fixes' trailer, please just include changes that fix that
commit.  You're patch does much more than just modifying the changes
=66rom commit 0e1aa629f1ce.

Kind regards,
Nicolas

