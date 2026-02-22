Return-Path: <linux-kbuild+bounces-11353-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 9cUYCrM6m2mQwQMAu9opvQ
	(envelope-from <linux-kbuild+bounces-11353-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sun, 22 Feb 2026 18:19:47 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E55716FE35
	for <lists+linux-kbuild@lfdr.de>; Sun, 22 Feb 2026 18:19:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6765C3008322
	for <lists+linux-kbuild@lfdr.de>; Sun, 22 Feb 2026 17:19:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A12C111CAF;
	Sun, 22 Feb 2026 17:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dHhsOjT0"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D956B665
	for <linux-kbuild@vger.kernel.org>; Sun, 22 Feb 2026 17:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771780782; cv=pass; b=ivw4tgSsqQ4Ml192xKWRkhjhYv4ybK0MFP8GPcUZBZ4feL9imHW46oo4ho/dJA2cSYE7WrOWZReJaD5T/4DLZZWm2JipZmcZrPJYaMZwMthfdu4krhWwlcdlrw7kWcBUykwRgHySAsn5i4QjYQeByu32klyO3FoUBWXpnWACqe0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771780782; c=relaxed/simple;
	bh=YhJCavRdyYp/NOlDfAWp8aYSm2DQ3STKNYJKjUSSdq4=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=JH2T0C45vnGx70kXJaZBvx1NBSWoC7MUgl3+LYOZ6QaxCWyaI65F1RPCJx7FLApwc0Q9QB5G8DuJLcBN1Ge85MypBobploFU9UIX4Z9lb270RR8h5bTz2NlHZnNqne7B3zhzV5dzwotJYgAnK6IhQrHPo7P83qHKOokkuuVqvuA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dHhsOjT0; arc=pass smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-354c6619a07so1384054a91.3
        for <linux-kbuild@vger.kernel.org>; Sun, 22 Feb 2026 09:19:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771780781; cv=none;
        d=google.com; s=arc-20240605;
        b=VDNW+275VZAZE4xoxyt2h3ctw8lW7wnl++LfbStaHuRPzVEmckzznjmy9bIWMQW6YJ
         aMGmBBXQR8HizUNXUPclTl2tt6UHU0n6QxP3uVXziG/vwsN0PGQoUfzJqf747Zq2PNpz
         HjQwJ67HeZ0U2hJwR0d8YhdFaJY9o4+MgJQw1PXV2K4a3QIaiYCtZ5w9OM/DV02wtrOE
         gYsIhTc+cnpetb94FSRLckDycnLB+6u7qQh4zfqpep2EEaCsgo1486Lu/W083xToXER/
         yzq3u7WLEq9ePGubYDxC2xHRvWFmFCMSHcSn4SaJ9qOco5MFs5V/KXtV62WzH46TUzr0
         /YYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=G4wZGin/AuhmtRNXvp2zhradfKhImK933VXJe9Cub7I=;
        fh=AysKwrq9tyzODJsHI2LdkFQdk5M8cjLD5D4+ApUd5lo=;
        b=jK1L7gF7QkVeQpVIqoyX2IReDeKat2bXXW/uoXCLeYJTbarUb8vw5yE1hFZDZY/Z53
         Ryl32/GJ5ZB/vHsjtnwZWUcJBDUz1QVHKa7Fpy2iu35JMyTrZFPpjd7fXRJmJiUNgczd
         HrFtUJPciLtqHTb26gLF+64KwhUOO+rbSl0VlaH0KZikK771pSKvnIaks0OEsCGZWdcc
         X4lFlMlIRVNO2fTJ9bi1c0HAD6xtCtNDmY8u9Bw94bOzmQtqMkdXdzectU//mQ4wWFEk
         MmARU8BXTcg7O5Kcbvx6+MEPh9I1lRpYDLeeDCuD94bRNgfsqqZwpKUX+zY4I0R0NryH
         qIiQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771780781; x=1772385581; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=G4wZGin/AuhmtRNXvp2zhradfKhImK933VXJe9Cub7I=;
        b=dHhsOjT0+jJl5xtJpVCo6Kv8JASlO3Rgbf8I85DzKYWeidm/TWZ513J2Ktlty+E+zN
         Ciay9gWRmN/bKeXFNTnMqyrhbsGPP2n4NhKfXK5wpjzSsOisp5um4etMIsI2ndn6Y6A0
         1FCr+WFPYml3/oBGhUIT06s1yc1iep6tfznu4ScSHlZcG3hHDro/Fvi/SjG9PnvVqMv6
         0NfkNwJ7QNriyAvFebsFfkNIF/t/l0XD3YIEakFZKlvmthp2PN4oGadDx5xWob2i7qQU
         /mY7RGpx8l6MUZ3ZFHQczyq/Hdj/VecIA8b0J5PI9/WhPI4TdTQo7icUo/RTzHC8tmtd
         bz2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771780781; x=1772385581;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G4wZGin/AuhmtRNXvp2zhradfKhImK933VXJe9Cub7I=;
        b=kyUlVASpDZYDVfk2FQ1bST2R6V9LSlv0uq6RuFRvjNVFXQV+CIJLcMGzEmzFCjXjgF
         MUpZcVBe0EVoNu5QKrdin7oCYdPSWHbM+NpMlzw0+M6F3BigPip95lVfYL81dGwIyOLX
         Y83gfA57nmJ2a2JotS4877xdlOAv9QMIpR+oqHf+2eCCU3WxgJnRIWyJf3GsuPitfoBU
         y3d8uMlBcl4g7s5Pvy0MamJ5JHw1lh7jGLcKwSOROz7/usO8kTC4YSJ1DUlEf1nobbMI
         118VpIJjbt/KEHEdqzjZ10q8E2LO7SAw6RdDvrF80HkgACr2KbXqAVOK4KaMwW5G4RKg
         8KPw==
X-Gm-Message-State: AOJu0YyRPOHdSCaW5DXWA1t0ZUJxOvOP5R/7UHODANPJIxZv+IRhWHue
	AfrHWBiAirPQLPgx7jyiiER3EuRccwKKBLwPlBifEDbRgXdMeTSNoHGboY4TQKuZQ/0I6JFEWgf
	vDovG6r969ZExEgi5MgqdzxadSmG4HpFBUcE9s+7Q9hIeDvvYXQ==
X-Gm-Gg: AZuq6aLJPeOPB/fxGdIfadXaerd8wgveZZyGsOwpIUxKDpBZAZHF0E0xNLkgmctu5Lr
	HTrrAQEGK1VXkct63xKQt8SYzTFMCNl+widy9yIZamebMb5LzE2//AvA3zhkQx6nn5zQJK1CoHA
	4/tUYLAvk5tjZzk8s2GBQ77QpjyzAC3X0/QppQe/qBDK2VhGQcsEq4SY7j9fmywbNNQQFKIEGmM
	q5giFMgH+5g0HhLvWIvJoohqTwMTgEaQUqC4XQcz51O0CqmmGsOaefFYEGT2EKV47w0Ni21OEem
	JxEOOx1xoO6qmj1xu8p1zvZdPkFt3UDpVqZ/oPwGl8o0PtN1+qbYFxRZsBEtRPAGDejiwoTXDQ=
	=
X-Received: by 2002:a17:90b:544c:b0:340:2a16:94be with SMTP id
 98e67ed59e1d1-358ae7c359emr4904760a91.4.1771780780823; Sun, 22 Feb 2026
 09:19:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Bogdan Metla <edistuo.revresbo@gmail.com>
Date: Sun, 22 Feb 2026 20:19:29 +0300
X-Gm-Features: AaiRm51Oib3E0Y7fufYOwcdmAYOYN4n7NhKKRPBKyxpfVZ9kzPLGEC2CEEnaGpg
Message-ID: <CACT+mvZJo4ZdWbwY1=MpJqJg=Xf3y4QCiSy9APvMZaCh4GBBKw@mail.gmail.com>
Subject: tools-support-relr.sh segfaults when NM is empty
To: linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-11353-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_ONE(0.00)[1];
	FREEMAIL_FROM(0.00)[gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[edistuorevresbo@gmail.com,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tools-support-relr.sh:url]
X-Rspamd-Queue-Id: 9E55716FE35
X-Rspamd-Action: no action

Hello

Problem:
When NM is unset or empty, tools-support-relr.sh executes a temporary
file as a program, causing a segfault:

  test -z "$($NM $tmp_file ...)" =E2=86=92 test -z "$($tmp_file ...)" =E2=
=86=92 segfault!

Root cause:
The script uses #!/bin/sh -eu, but -u only catches unset variables,
not empty strings. When NM=3D"", the command becomes `$tmp_file`, which
tries to execute the temporary object file.

Reproduction:
  unset NM
  export srctree=3D. SRCARCH=3Dx86 CC=3Dgcc LD=3Dld
  python3 -c "from kconfiglib import Kconfig; Kconfig('Kconfig', warn=3DFal=
se)"
  dmesg | grep -i segfault  # Shows segfault in tmp.XXXXXX

Expected behavior:
Clear error message like "NM must be set" instead of segfault.

Fix:
Add explicit check at start of tools-support-relr.sh:
  : "${NM:?NM must be set}"

