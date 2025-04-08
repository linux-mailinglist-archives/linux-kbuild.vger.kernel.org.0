Return-Path: <linux-kbuild+bounces-6512-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 91554A7F7FD
	for <lists+linux-kbuild@lfdr.de>; Tue,  8 Apr 2025 10:36:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 105463A5061
	for <lists+linux-kbuild@lfdr.de>; Tue,  8 Apr 2025 08:35:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 188CA20B7EF;
	Tue,  8 Apr 2025 08:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="hFtMJlQt"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtpbgbr1.qq.com (smtpbgbr1.qq.com [54.207.19.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C93A5156CA;
	Tue,  8 Apr 2025 08:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.207.19.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744101369; cv=none; b=rgmS+bkAKLm8QN3RtwMi11TMB2GlGRTlrhkscNRZ4xhc4TVA6HiU3Z80R5ZSZv7AnypEH6dJVxhQkOsMkUPWCxl7oBOMsEMkqZF9VhhtH9WSaEgc1SPEAhNqT9sDzXwwpQlrei03bYo5AD/V0xTlCTNcbF6Z0Il/DKywfjkuJ5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744101369; c=relaxed/simple;
	bh=mzMfxAueJ3ZwWsr2CHBeJPRrTw/FwTzzBC5ucJhL2fY=;
	h=Message-ID:Date:MIME-Version:Subject:Cc:References:From:
	 In-Reply-To:Content-Type; b=RTaFF2ZDNGl9eUsDbOvmfff40VnyP7Z2HiEP3ZsTaDnFe8ufwvZ3+QcmOkb307SCxa9SA5JCC5akm4Cjkd5ekdF1IB7f+/U6oet/GP63FQ3Qe2l9/uoHixgYN5V8GZC5x/JwLdMjgKKa2q1dVN0uB7axNm5jlaHp7Wv6YnlXdaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=hFtMJlQt; arc=none smtp.client-ip=54.207.19.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1744101320;
	bh=mzMfxAueJ3ZwWsr2CHBeJPRrTw/FwTzzBC5ucJhL2fY=;
	h=Message-ID:Date:MIME-Version:Subject:From;
	b=hFtMJlQtddxNcHQVngIMyaVD7hc4YWJnWWMNDG0r9CDOh+urltFUYGnAWTdfSmeE9
	 erpJiehVQwk+n5PaLaqnwwnBnPdG4qWm5xp7983uGPyByLshmuqNhKw6y5PO8jvTUH
	 XlnQc5GGO14WUeniiJXG+uzcar+rc6ZczWu2PNcU=
X-QQ-mid: bizesmtpip3t1744101310t5651a7
X-QQ-Originating-IP: RmaqZH5hr4481NUI7HYifJ4cNp0cXuiOQek1MvsFBMU=
Received: from [IPV6:240e:668:120a::212:156] ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 08 Apr 2025 16:35:08 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 14910186757885448490
EX-QQ-RecipientCnt: 10
Message-ID: <8BFABE0C4796C2D3+aa206f17-7b7a-4f2b-b843-7318792a4702@uniontech.com>
Date: Tue, 8 Apr 2025 16:35:08 +0800
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] kbuild: rpm-pkg: Add elfutils-devel to
 BuildRequires
Cc: guanwentao@uniontech.com, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, masahiroy@kernel.org, nathan@kernel.org,
 nicolas.schier@linux.dev, niecheng1@uniontech.com, petr.pavlu@suse.com,
 samitolvanen@google.com, zhanjun@uniontech.com
References: <215802BA292C2DF6+20250408081441.61776-1-wangyuli@uniontech.com>
 <964B3FC2F607F2F4+20250408081921.63040-2-wangyuli@uniontech.com>
Content-Language: en-US
From: WangYuli <wangyuli@uniontech.com>
Autocrypt: addr=wangyuli@uniontech.com; keydata=
 xjMEZoEsiBYJKwYBBAHaRw8BAQdAyDPzcbPnchbIhweThfNK1tg1imM+5kgDBJSKP+nX39DN
 IVdhbmdZdWxpIDx3YW5neXVsaUB1bmlvbnRlY2guY29tPsKJBBMWCAAxFiEEa1GMzYeuKPkg
 qDuvxdofMEb0C+4FAmaBLIgCGwMECwkIBwUVCAkKCwUWAgMBAAAKCRDF2h8wRvQL7g0UAQCH
 3mrGM0HzOaARhBeA/Q3AIVfhS010a0MZmPTRGVfPbwD/SrncJwwPAL4GiLPEC4XssV6FPUAY
 0rA68eNNI9cJLArOOARmgSyJEgorBgEEAZdVAQUBAQdA88W4CTLDD9fKwW9PB5yurCNdWNS7
 VTL0dvPDofBTjFYDAQgHwngEGBYIACAWIQRrUYzNh64o+SCoO6/F2h8wRvQL7gUCZoEsiQIb
 DAAKCRDF2h8wRvQL7sKvAP4mBvm7Zn1OUjFViwkma8IGRGosXAvMUFyOHVcl1RTgFQEAuJkU
 o9ERi7qS/hbUdUgtitI89efbY0TVetgDsyeQiwU=
In-Reply-To: <964B3FC2F607F2F4+20250408081921.63040-2-wangyuli@uniontech.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------2wVuXK0f0SL55SpJ26paKBNj"
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: NSTiGhYb0MY63XCGtQ3oK413sB0gefN1AOvvv1ye2rWcMwO4Wc3U08V/
	dAlTJ9GZqYdwgdoEIC8jzybs+o+uj6uLi06e136UvBeabAVW5SVhdc12gJ+fTTU7tPJJzie
	pWdCV3+aNrpvM2WZ6DKqTtFgqKK7rx89RrPXBvoEDigWlvpkpj2M4m5m8QlAqOxh3DP1mWq
	Yt6bD9KhDEyLk9DzarnNUwnx9ftpomAStcmOhg1EPCVPLNEc3enDwVWDxjQWTltBsxYWBo7
	jrlGsy/yHojMiwIes8r5fwiQSdPYNlJQ3MOeXjYZ6fbMTTf8bIAs+Zt5X553ckuPMRFD3BJ
	4dIyO3eZm9nGDFyy65lizrfQzSIHEQ/V2xQwyid0TBgUP3V2cffh5l+lRj56KwgWtmDsL93
	ePY/U/C/+vvdN9blk3l8hDjxF2HmW4FJx+d16VB90NAGuBwwmXhZakoLDa4QDuTAR50Nap/
	TgZnHhKp7ysI9lxmtblSD2RqLQ9DJe4kTkf1vxjvmV7orOpq3Z5WpiHcsnXiksoSqaXofdQ
	03OaJpByHBNlPxcJwK1ZQ1F1bX+rhEotJ88O/c/kiakYjvBYetNZrt58AEgZvTB4gzKHXKu
	sKsCgTV2K6ej1F4LPh4i9+Y2jN0d1ZVS1f5078Y721WMLV0JYnkz0WE3HUkYoqsoZA8ECn3
	dosiKrcv5XYnMvbkKD7Bqrxm1uwDE0oCZU4VE1Q8WAcj0/OO7g6+li6pl9UpGeS96L0FotX
	nfwYOq9X9wfAYiJdfsJo+doYeyUpYFngfE7ycnrP3C87QAhS4FW+ogVu1f82eDjXkYPJL3e
	j1jrjeE5j4g/cSdRn0EmQevAsIDa9VFwbVsPAVkgVyqPbvBV7VRYBnrHT7Eh/zpJJIKpQqp
	xrBk2S2JxKdHOM26XeoBiMNddN67kUE5Wow9nfV/rUdqDzzRPzCUQakCAylUhGces9OTMQJ
	dMHP4vLKjJ9X2R0ayJHB7+IyR4yHNpmeJVUd2EbCpOtJsexnEKzx5x4ZarPcd0ig7xICtKN
	X1LK3mmRW3S3DNKR6TThWSVTOeuRsNmfo8Recr6obBqyTeZV6o
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
X-QQ-RECHKSPAM: 0

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------2wVuXK0f0SL55SpJ26paKBNj
Content-Type: multipart/mixed; boundary="------------tOXAy93uQtA6f5XKoqrdW45E";
 protected-headers="v1"
From: WangYuli <wangyuli@uniontech.com>
Cc: guanwentao@uniontech.com, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, masahiroy@kernel.org, nathan@kernel.org,
 nicolas.schier@linux.dev, niecheng1@uniontech.com, petr.pavlu@suse.com,
 samitolvanen@google.com, zhanjun@uniontech.com
Message-ID: <aa206f17-7b7a-4f2b-b843-7318792a4702@uniontech.com>
Subject: Re: [PATCH v2 2/2] kbuild: rpm-pkg: Add elfutils-devel to
 BuildRequires
References: <215802BA292C2DF6+20250408081441.61776-1-wangyuli@uniontech.com>
 <964B3FC2F607F2F4+20250408081921.63040-2-wangyuli@uniontech.com>
In-Reply-To: <964B3FC2F607F2F4+20250408081921.63040-2-wangyuli@uniontech.com>

--------------tOXAy93uQtA6f5XKoqrdW45E
Content-Type: multipart/mixed; boundary="------------Lm2SeCT0ensXmBg7P1tPw32s"

--------------Lm2SeCT0ensXmBg7P1tPw32s
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

QXBvbG9naWVzLCB0aGUgY29tbWl0IG1lc3NhZ2UgaGFkIGEgc21hbGwgcHJvYmxlbS4gSSB3
aWxsIHJlcGx5IHRvIHRoaXMgDQp3aXRoIHRoZSByZXZpc2VkIHYzLi4uDQoNCi0tDQoNCldh
bmdZdWxpDQoNCg==
--------------Lm2SeCT0ensXmBg7P1tPw32s
Content-Type: application/pgp-keys; name="OpenPGP_0xC5DA1F3046F40BEE.asc"
Content-Disposition: attachment; filename="OpenPGP_0xC5DA1F3046F40BEE.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

xjMEZoEsiBYJKwYBBAHaRw8BAQdAyDPzcbPnchbIhweThfNK1tg1imM+5kgDBJSK
P+nX39DNIVdhbmdZdWxpIDx3YW5neXVsaUB1bmlvbnRlY2guY29tPsKJBBMWCAAx
FiEEa1GMzYeuKPkgqDuvxdofMEb0C+4FAmaBLIgCGwMECwkIBwUVCAkKCwUWAgMB
AAAKCRDF2h8wRvQL7g0UAQCH3mrGM0HzOaARhBeA/Q3AIVfhS010a0MZmPTRGVfP
bwD/SrncJwwPAL4GiLPEC4XssV6FPUAY0rA68eNNI9cJLArOOARmgSyJEgorBgEE
AZdVAQUBAQdA88W4CTLDD9fKwW9PB5yurCNdWNS7VTL0dvPDofBTjFYDAQgHwngE
GBYIACAWIQRrUYzNh64o+SCoO6/F2h8wRvQL7gUCZoEsiQIbDAAKCRDF2h8wRvQL
7sKvAP4mBvm7Zn1OUjFViwkma8IGRGosXAvMUFyOHVcl1RTgFQEAuJkUo9ERi7qS
/hbUdUgtitI89efbY0TVetgDsyeQiwU=3D
=3DBlkq
-----END PGP PUBLIC KEY BLOCK-----

--------------Lm2SeCT0ensXmBg7P1tPw32s--

--------------tOXAy93uQtA6f5XKoqrdW45E--

--------------2wVuXK0f0SL55SpJ26paKBNj
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQRrUYzNh64o+SCoO6/F2h8wRvQL7gUCZ/TfvAUDAAAAAAAKCRDF2h8wRvQL7opS
AQC1V6d2v5Hcnvb7l6YxFnsat/OKQtYLieifSNxFBngMwAEAyIqSopo14HVGSxPsczJAVYDfyPjF
Tfb0rQzTV6qiZwU=
=+Lmv
-----END PGP SIGNATURE-----

--------------2wVuXK0f0SL55SpJ26paKBNj--

