Return-Path: <linux-kbuild+bounces-5189-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DDB709F7555
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Dec 2024 08:24:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EA2B416CD79
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Dec 2024 07:24:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D316A7082A;
	Thu, 19 Dec 2024 07:23:53 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx1.emlix.com (mx1.emlix.com [178.63.209.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A8A521771E;
	Thu, 19 Dec 2024 07:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.63.209.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734593033; cv=none; b=Y7pg2Hhr3Pf/6t+opzsj0EeWYeJYCNOUnJwFcacl4GJUVKwDJhgFTCJOHYX0ZKWbnszg5kVVb57WkcNl9S1MWYHjMNxrbCP8qX8LjJM3FoVm326xNW0e6z0iCP/0Kr2h8nKKQ/7tOSVhXTIk0ijEKLk1K7nay9rlGiLRvXJ6uKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734593033; c=relaxed/simple;
	bh=P49GO8TGjYuVKT9hnmNxjhhzt3nwNBmXFHX0asn6OII=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Gid+xJyEAlOmpsfspYSZNThdrKrRBcOAeyxm1/abuUUohkrh03ZQZsogLBqnNuDMOg7NQsLEaQmZWMcgJ1JS7X0lc30XalYtflWls8XJa3SQ1fYAgNfnZworaVQtb9tnlQTyfM/+hCbFAPtCL1quRMGuwAQhDBgk5ovKdDoE+Og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emlix.com; spf=pass smtp.mailfrom=emlix.com; arc=none smtp.client-ip=178.63.209.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emlix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=emlix.com
Received: from mailer.emlix.com (p5098be52.dip0.t-ipconnect.de [80.152.190.82])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.emlix.com (Postfix) with ESMTPS id 298D85FEEB;
	Thu, 19 Dec 2024 08:23:12 +0100 (CET)
From: Rolf Eike Beer <eb@emlix.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] improve qconfig C++ code, take 2
Date: Thu, 19 Dec 2024 08:19:21 +0100
Message-ID: <5843611.DvuYhMxLoT@devpool47.emlix.com>
Organization: emlix GmbH
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart6110953.lOV4Wx5bFT";
 micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPart6110953.lOV4Wx5bFT
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Rolf Eike Beer <eb@emlix.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] improve qconfig C++ code, take 2
Date: Thu, 19 Dec 2024 08:19:21 +0100
Message-ID: <5843611.DvuYhMxLoT@devpool47.emlix.com>
Organization: emlix GmbH
MIME-Version: 1.0

This is a followup to my earlier series, which has been partially applied=20
already. Other patches that became obsolete by unrelated refactoring have b=
een=20
dropped.

The review comments have been addressed. The nullptr patch should now be=20
complete and catch every "0" in qconf.cc and qconf.h. One additional patch =
has=20
been added that removes a constructor overload that would have needed this=
=20
treatment otherwise as well.

Regards,

Eike
=2D-=20
Rolf Eike Beer

emlix GmbH
Headquarters: Berliner Str. 12, 37073 G=C3=B6ttingen, Germany
Phone +49 (0)551 30664-0, e-mail info@emlix.com
District Court of G=C3=B6ttingen, Registry Number HR B 3160
Managing Directors: Heike Jordan, Dr. Uwe Kracke
VAT ID No. DE 205 198 055
Office Berlin: Panoramastr. 1, 10178 Berlin, Germany
Office Bonn: Bachstr. 6, 53115 Bonn, Germany
http://www.emlix.com

emlix - your embedded Linux partner
--nextPart6110953.lOV4Wx5bFT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iLMEAAEIAB0WIQQ/Uctzh31xzAxFCLur5FH7Xu2t/AUCZ2PI+gAKCRCr5FH7Xu2t
/EJjBACwvkml9fqFt7Fm5ygH2JxXuYEgjoMr0jvRe/kvmb0l0jljaVM3wG26Njgc
M09maqljUVtb5SJahG/IVE71WoW3IE3fgNBDcq6tMe/cZ567/jSWl9buWuRl6rl1
EjW8F7yDmdURNMuJi9BDpBIGkWZwgRsgFkHGxcGcrzMBZdp8sA==
=78pK
-----END PGP SIGNATURE-----

--nextPart6110953.lOV4Wx5bFT--




