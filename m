Return-Path: <linux-kbuild+bounces-11004-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ECmANy4JgmmCOQMAu9opvQ
	(envelope-from <linux-kbuild+bounces-11004-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 03 Feb 2026 15:41:50 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A6A1DAB8D
	for <lists+linux-kbuild@lfdr.de>; Tue, 03 Feb 2026 15:41:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D653D302D8AA
	for <lists+linux-kbuild@lfdr.de>; Tue,  3 Feb 2026 14:41:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C51CA3AA1AD;
	Tue,  3 Feb 2026 14:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tngtech.com header.i=@tngtech.com header.b="WnTP0F7v"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mailgw01.zimbra-vnc.de (mailgw01.zimbra-vnc.de [148.251.101.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAFE73AA19F;
	Tue,  3 Feb 2026 14:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.101.236
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770129708; cv=none; b=AdSdcScFELIfkebyToI0dZH1vu7FG3FF2BiHbc5nZNzxoSITdHE8naFLDLivnGZyuE0OSsAz9krFKoHjOKIWKD4GI1CzS7qUyz+Sb+oRdW1XaHh0fXUkeGHNFWaWrkbCK8IvcVzuchETHFt/oBIp3f5wHq2Z6LysYtTYa6Thp6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770129708; c=relaxed/simple;
	bh=I4RHwisz8K9FsHUmxVmdmJhJRXV8pYWJXDJetMXFLwA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RkYVEzoO4l3AgX2J7To/3/6Re8DbqNun8OEwb1cvi2Sw2xMkD//6nF1XRHhA3RIJfgblJVwYlV8XZaJG0qsCMUbyG2kC1ZJjmCn7Vh40x0EuHF49+Ls6kwumwLDf8p1s/xKIrkOa36H/bEYWJgJgQlNdJ9ufYZcef0h9xdf5qE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tngtech.com; spf=pass smtp.mailfrom=tngtech.com; dkim=pass (2048-bit key) header.d=tngtech.com header.i=@tngtech.com header.b=WnTP0F7v; arc=none smtp.client-ip=148.251.101.236
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tngtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tngtech.com
Received: from zmproxy.tng.vnc.biz (zimbra-vnc.tngtech.com [35.234.71.156])
	by mailgw01.zimbra-vnc.de (Postfix) with ESMTPS id 4250A3FB8D;
	Tue,  3 Feb 2026 15:41:44 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTP id ECFB81FA898;
	Tue,  3 Feb 2026 15:41:43 +0100 (CET)
Received: from zmproxy.tng.vnc.biz ([127.0.0.1])
 by localhost (zmproxy.tng.vnc.biz [127.0.0.1]) (amavis, port 10032)
 with ESMTP id nC8bJGb3Vi4Y; Tue,  3 Feb 2026 15:41:43 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTP id 65D0C1FA8A6;
	Tue,  3 Feb 2026 15:41:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 zmproxy.tng.vnc.biz 65D0C1FA8A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tngtech.com;
	s=B14491C6-869D-11EB-BB6C-8DD33D883B31; t=1770129703;
	bh=mquDuxVxsSkpZn6LlrWxKAEU4cLLT3zrvMfIGUBFyj4=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=WnTP0F7v9pWb8JCY/MipgbtrD39wCN0f8Z4tTADqyhWtLnL8/l7aVyfqiSXA6tN7Z
	 Zzxc9NduwD/3UtQLOp6KVvbPQAm+WqmwNlqb9YWSS2WGJ1/2O4DammvHu8KU65a+fk
	 zJxf2vXcOG0Na7ZFCcEADLQOccxeee6jvCPy/DOkEOfqdoir2tyBh1qC+CR5owr4jZ
	 eh6gQxaEgT9tWnLUgF/bbaf5o7jlQrmpZUL2PO3YyLgau5m/rNwcyagPEQx5oPDxYv
	 qrMAXIzpHezyYpHj2T0Dz1nYZ1zTRGb0bDCDAxn92ekuF1OjdMm9f3V/ZKCdKzW/9y
	 vrLPtVubbNc7g==
X-Virus-Scanned: amavis at zmproxy.tng.vnc.biz
Received: from zmproxy.tng.vnc.biz ([127.0.0.1])
 by localhost (zmproxy.tng.vnc.biz [127.0.0.1]) (amavis, port 10026)
 with ESMTP id wW01VCbpL2-9; Tue,  3 Feb 2026 15:41:43 +0100 (CET)
Received: from [192.168.0.168] (ipservice-092-208-231-176.092.208.pools.vodafone-ip.de [92.208.231.176])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTPSA id D841B1FA6EC;
	Tue,  3 Feb 2026 15:41:42 +0100 (CET)
Message-ID: <a6f5f9e9-3652-4aff-8422-05e1c88850de@tngtech.com>
Date: Tue, 3 Feb 2026 15:41:42 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/14] Add SPDX SBOM generation tool
To: Nathan Chancellor <nathan@kernel.org>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Greg KH <gregkh@linuxfoundation.org>, nsc@kernel.org,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 akpm@linux-foundation.org, maximilian.huber@tngtech.com
References: <20260120115352.10910-1-luis.augenstein@tngtech.com>
 <CANiq72mtWhjVNNYc6nvxuQ3XAnMWBDiZyOvJ1BNN=M+097Wvpw@mail.gmail.com>
 <2026012214-magician-mashed-c84c@gregkh>
 <CANiq72mcDqAS-FUfkAnxa7OEO4Kq6r6=uvhEb_UW4sGattCOuQ@mail.gmail.com>
 <2026012533-preflight-surviving-43e5@gregkh>
 <CANiq72=_tPP4cPaUMPiM14h1kk97EXSf5vg-yHHYo-Px+31ZSg@mail.gmail.com>
 <a01233b9-23a2-4666-91ed-f1cf030dcb9f@tngtech.com>
 <20260127231037.GA3378797@ax162>
 <6ed0fe99-3724-40c2-8d98-3309a3cf0104@tngtech.com>
 <20260203004032.GA52989@ax162>
From: Luis Augenstein <luis.augenstein@tngtech.com>
Autocrypt: addr=luis.augenstein@tngtech.com; keydata=
 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 JQQ=
In-Reply-To: <20260203004032.GA52989@ax162>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------bq0JoMBpUXOQyUJ8Lay0gAbL"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.66 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[tngtech.com,quarantine];
	R_DKIM_ALLOW(-0.20)[tngtech.com:s=B14491C6-869D-11EB-BB6C-8DD33D883B31];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,linuxfoundation.org,kernel.org,vger.kernel.org,linux-foundation.org,tngtech.com];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	DKIM_TRACE(0.00)[tngtech.com:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11004-lists,linux-kbuild=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	HAS_ATTACHMENT(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[luis.augenstein@tngtech.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 8A6A1DAB8D
X-Rspamd-Action: no action

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------bq0JoMBpUXOQyUJ8Lay0gAbL
Content-Type: multipart/mixed; boundary="------------9Iv7YZjM15vM601MzNtwD00W";
 protected-headers="v1"
Message-ID: <a6f5f9e9-3652-4aff-8422-05e1c88850de@tngtech.com>
Date: Tue, 3 Feb 2026 15:41:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/14] Add SPDX SBOM generation tool
To: Nathan Chancellor <nathan@kernel.org>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Greg KH <gregkh@linuxfoundation.org>, nsc@kernel.org,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 akpm@linux-foundation.org, maximilian.huber@tngtech.com
References: <20260120115352.10910-1-luis.augenstein@tngtech.com>
 <CANiq72mtWhjVNNYc6nvxuQ3XAnMWBDiZyOvJ1BNN=M+097Wvpw@mail.gmail.com>
 <2026012214-magician-mashed-c84c@gregkh>
 <CANiq72mcDqAS-FUfkAnxa7OEO4Kq6r6=uvhEb_UW4sGattCOuQ@mail.gmail.com>
 <2026012533-preflight-surviving-43e5@gregkh>
 <CANiq72=_tPP4cPaUMPiM14h1kk97EXSf5vg-yHHYo-Px+31ZSg@mail.gmail.com>
 <a01233b9-23a2-4666-91ed-f1cf030dcb9f@tngtech.com>
 <20260127231037.GA3378797@ax162>
 <6ed0fe99-3724-40c2-8d98-3309a3cf0104@tngtech.com>
 <20260203004032.GA52989@ax162>
From: Luis Augenstein <luis.augenstein@tngtech.com>
Autocrypt: addr=luis.augenstein@tngtech.com; keydata=
 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 JQQ=
In-Reply-To: <20260203004032.GA52989@ax162>
Autocrypt-Gossip: addr=maximilian.huber@tngtech.com; keydata=
 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
 /5CE/Cgrmg==

--------------9Iv7YZjM15vM601MzNtwD00W
Content-Type: multipart/mixed; boundary="------------WJF3kDyyYt3N6KYIcEjRRBxU"

--------------WJF3kDyyYt3N6KYIcEjRRBxU
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Nathan,

> 2. This depends on having a clean initial build tree (either empty
>    directory or 'clean' as a make target) due to needing to parse the
>    .cmd files, which could be stale if someone builds a kernel, changes=

>    their config, and rebuilds, right? This should be documented since I=

>    do not think it is possible to do something like what Masahiro did i=
n
>    commit 3d32285fa995 ("kbuild: wire up the build rule of
>    compile_commands.json to Makefile") because of the drawback that it
>    misses too many things.

There might be edge cases, but in general stale .cmd files should not be
an issue.

The script does not scan the build tree for .cmd files. It starts from a
set of root build artifacts (kernel image and .ko modules listed in
modules.order). From these roots, it parses the corresponding .cmd files
to discover the immediate dependencies, and then recursively processes
the .cmd files of those dependencies, effectively walking the entire
dependency graph up to the individual source files.

Stale .cmd files should not be referenced as dependencies by the root
artifacts and therefore not be part of the resulting dependency graph.

Best,
Luis

--=20
Luis Augenstein * luis.augenstein@tngtech.com * +49-152-25275761
TNG Technology Consulting GmbH, Beta-Str. 13, 85774 Unterf=C3=B6hring
Gesch=C3=A4ftsf=C3=BChrer: Henrik Klagges, Dr. Robert Dahlke, Thomas Endr=
es
Aufsichtsratsvorsitzender: Christoph Stock
Sitz: Unterf=C3=B6hring * Amtsgericht M=C3=BCnchen * HRB 135082

--------------WJF3kDyyYt3N6KYIcEjRRBxU
Content-Type: application/pgp-keys; name="OpenPGP_0x795C8ACACDDCFB34.asc"
Content-Disposition: attachment; filename="OpenPGP_0x795C8ACACDDCFB34.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
tQXRyz0F2tHrTjqKJQQ=3D
=3Dgh9z
-----END PGP PUBLIC KEY BLOCK-----

--------------WJF3kDyyYt3N6KYIcEjRRBxU--

--------------9Iv7YZjM15vM601MzNtwD00W--

--------------bq0JoMBpUXOQyUJ8Lay0gAbL
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEEJzBrWn4qHw5a0jAXeVyKys3c+zQFAmmCCSYFAwAAAAAACgkQeVyKys3c+zRB
WQ//bw5KimhgGJy/Fp2j34FlgT5HpZGD1/lLi+ZLoJsFrpjQ06a2k9uCrCW2mZXszIZbPp35jZbi
1SJPnBHP3dLV6wHUWUCZ/pWDbBPgjdUyBEIbtMVHTwNi0NUzYyvyENrq0n4m7Susc0WBq16eZlgY
QlISn2YStCxdTbnBY/zncPHHIlaey7YbbWyoGIxV7VBHhGw0mPWvS+wqYmEb7ev18Ag+bipyWt5b
UuBU3azYLXrShifqo+i8ILPztLWkNTERoPIxXDxLoK1eAxL3pZ1C36gQAY6gt8y54/p/0LlN1EAM
iv3vDkpddFqxIf8IRfSjuNTPs25BavYlRPdobVCLD8PMDXSnayRBRlyBXzn9CblmITALvh6OS9MA
y22aGOfXFH2WfIagKrt6MGpa4RJ4hmE47Y4b04Fz00bQfCHoJQ6QLfl3MpY3/OtFrB8DePY/XspM
EJ5ywhCVbgKK0xxfu5r4ZyArB2gg51t0PbmykXIv6lRUvYjn7t/0L4qJ9YV72qyJS9JilS6CqTBt
fuCaOri0JKRQvyVbHqg7QdMEuzMmN7lPdVeOU7/xOQ+RncyNONTUtqSVmaEkxl+9n8bwROsMK3Td
KT5t7a5BrBPpV0EyYnpo6gf7oqQS32TCxZeyC6+em4HTyag0is/cVf2VUcWy16m8PXoGExDvbqWL
+lE=
=vZ53
-----END PGP SIGNATURE-----

--------------bq0JoMBpUXOQyUJ8Lay0gAbL--

