Return-Path: <linux-kbuild+bounces-700-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 80F6D83F614
	for <lists+linux-kbuild@lfdr.de>; Sun, 28 Jan 2024 16:19:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 304C5283C67
	for <lists+linux-kbuild@lfdr.de>; Sun, 28 Jan 2024 15:19:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC3DB1E511;
	Sun, 28 Jan 2024 15:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=envs.net header.i=@envs.net header.b="ccmz1ldJ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail.envs.net (mail.envs.net [5.199.136.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57A5123769
	for <linux-kbuild@vger.kernel.org>; Sun, 28 Jan 2024 15:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.199.136.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706455143; cv=none; b=MUyncFJ8Z8cYoLISA+Q6AwJ07niLOiU3aNI1sj1R9cYfJJoEi9ZoZS+gTlLAceJvDhLPmnsA6Lo0lN10PoItnFytV16OPxfkpxV61CJRQuPWZX04PtvUJyDjtSAdlsdzCOgD0Og4ygCt6rBTuib0AawmLUVPWV9sEk3HXL1epO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706455143; c=relaxed/simple;
	bh=Tos3CGkQjYC2M2llMgF+RedAk4PDv39/zb8lx5Rx3HY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cXU0KvkRU18pJEmm/KrrILnTd/uoIpNSEntCQmXrKWKLrItRh8vF2RE0DT3lodoDkuZpxw01FIyz8xfpYwmLtpjN6fk5btqMzNX+K5xusklYq4/uDXP7/EioGsBE6dsV60LSrNjIDTCqGzRwiESs84ZNA1Q5XQ+A67hygxHPGeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=envs.net; spf=pass smtp.mailfrom=envs.net; dkim=pass (4096-bit key) header.d=envs.net header.i=@envs.net header.b=ccmz1ldJ; arc=none smtp.client-ip=5.199.136.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=envs.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=envs.net
Received: from localhost (mail.envs.net [127.0.0.1])
	by mail.envs.net (Postfix) with ESMTP id B94B838A05FD;
	Sun, 28 Jan 2024 15:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=envs.net; s=modoboa;
	t=1706455128; bh=WRAMMUfqBmfmMiIaCxCupaC5Mx1VQJebhS2r2YFntw8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ccmz1ldJmU+cJF8EcZoqeJoOMXMVRRRMsmpsyoptl8KDNukomHcJA9yPIqloXdJov
	 BQpoLYHwWlkgUgiXfcf1Ccp417HrcNeFVs7KOYea+HI5dJC4tS4Td0+ixfiVFTQfy1
	 mL/K/nepgYF/0KIhh+72qV4rvGwgVw3DF90GRYEWWE6e5zTvjLhd2uhqdmSsEKok5l
	 Skx1KZwb56iGtqZbRlbpJu1yOdagUxgoyGTL5PNBQQvGxa3qrdxaCaIkgBzWjWSSYr
	 pY6JqtQjUNKlgV1F1bzKjqheyQCxUNm5xQaGSJ5bZAOYuKfEYOJf3d/n9MBaIzE5hw
	 2m0CT0EyHDt/dSQ1LyhERgL5D0sYSymkKhk4UFoTV0WoD6qjVZ2/lzx4H1uIr2fLzS
	 KFkijrIE8hSY4VakwrVOmOrA4jrhyN1Ok7R8R+6vLJP0zTN2yE8ho/t+wtGmHv+erK
	 IWRY2fgwpI3R3KzYpcLvsY5gK8ricrJwr7NEc54SjwFzQ5QSqDkVrhZZe6Z3wrxut5
	 0FXZc+tWfbyohlSP3sNt38aAxxrnRimxVzPyGszLEwMvh9dMpZ/XJVc+4AUABNlKF1
	 oYgudCS/Mu9g2YlDGxjxQMuN2tEx24MI16UUXzl6pXzyU2HMqP9uDHDj2Xtlj6pKhP
	 Z18fwQPUgGjtwrZb+hndEXNk=
X-Virus-Scanned: Debian amavisd-new at mail.envs.net
Received: from mail.envs.net ([127.0.0.1])
	by localhost (mail.envs.net [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 2tKXAKefViZE; Sun, 28 Jan 2024 15:18:42 +0000 (UTC)
Received: from xtex.localnet (unknown [103.84.217.246])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.envs.net (Postfix) with ESMTPSA;
	Sun, 28 Jan 2024 15:18:42 +0000 (UTC)
From: Bingwu Zhang <xtex@envs.net>
To: Dmitry Goncharov <dgoncharov@users.sf.net>
Cc: linux-kbuild@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>,
 Martin Dorey <Martin.Dorey@hitachivantara.com>
Subject:
 Re: [v2] kbuild: Replace tabs with spaces when followed by conditionals.
Date: Sun, 28 Jan 2024 23:18:38 +0800
Message-ID: <6013705.lOV4Wx5bFT@xtex>
In-Reply-To:
 <CAG+Z0CsTWFxi74PKpCkPjM_-60PsvqS7gkZKs5yrsA8OqL6Hyg@mail.gmail.com>
References:
 <CAG+Z0CsTWFxi74PKpCkPjM_-60PsvqS7gkZKs5yrsA8OqL6Hyg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart4894617.31r3eYUQgx";
 micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart4894617.31r3eYUQgx
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
From: Bingwu Zhang <xtex@envs.net>
To: Dmitry Goncharov <dgoncharov@users.sf.net>
Date: Sun, 28 Jan 2024 23:18:38 +0800
Message-ID: <6013705.lOV4Wx5bFT@xtex>
MIME-Version: 1.0

Hi,

Are you sure this e-mail is a valid PATCH? You are using diff attachment, 
sending without "[PATCH]" prefix [1], adding text after "Signed-off-by". I also 
could not find the "v1" patch for this "v2" patch.

Please do not add diff as attachments [2], "git format-patch" and "git send-
email"

- [1] https://www.kernel.org/doc/html/latest/process/submitting-patches.html#include-patch-in-the-subject
- [2] https://www.kernel.org/doc/html/latest/process/submitting-patches.html#no-mime-no-links-no-compression-no-attachments-just-plain-text

-- 
  -- xtex Sun Jan 28 11:12:37 PM CST 2024

--nextPart4894617.31r3eYUQgx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRyMYBLBSxnDxWmdx25GAhu2ARbkQUCZbZwTgAKCRC5GAhu2ARb
kew4AQD/TsiItf4YJKCxH0oKXCHz15wb1j0vZO4R5yXk/hTFBgD+Ma4OVt+UqUGE
HwzK7EC+SjD4wveMTewWDzMHEbLU0wM=
=+nm6
-----END PGP SIGNATURE-----

--nextPart4894617.31r3eYUQgx--




