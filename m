Return-Path: <linux-kbuild+bounces-12765-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YJmXMgeq22mzEwkAu9opvQ
	(envelope-from <linux-kbuild+bounces-12765-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sun, 12 Apr 2026 16:19:51 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 699673E4328
	for <lists+linux-kbuild@lfdr.de>; Sun, 12 Apr 2026 16:19:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 117AF300A748
	for <lists+linux-kbuild@lfdr.de>; Sun, 12 Apr 2026 14:19:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37DAD36A035;
	Sun, 12 Apr 2026 14:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sdhn.cc header.i=@sdhn.cc header.b="EubzjMPM"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from outbound.ms.icloud.com (p-west3-cluster3-host10-snip4-10.eps.apple.com [57.103.72.251])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F30EC34D3B0
	for <linux-kbuild@vger.kernel.org>; Sun, 12 Apr 2026 14:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.72.251
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776003588; cv=none; b=ie4fRTfTdjx5pmxxmvtk0pLDoc/ehzL4bBB2TYRmW9feWZQOKXpRO5jWQO6NlNH5rGxnBc3U8zG7/PiDlyKp+Srpi10S1RyOaQlrmCNDDnno9CBd0Ureq+SiUufX6+XCOQfbO2g/zH6KwTJpqKhA81FPGGBhCRXSp4mKk3ROczc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776003588; c=relaxed/simple;
	bh=vxbcWFKH8bC2UxBSwdOke+KUEqb789/aUglKVMMIwmU=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cga4FhKloxYhZhSsKSYIOBXH/E5gt3HQ+W6lVVXZ84gddKM2Kji1pOqkZXkC/1sMrKGgPSAocNkWK7xGCt99T4SuI4bcmWFyIt3pJov6GIENaW30OSqIGDeAz+GCZIVJbCoANWi0JR/h1KcrFlp/EnrlQwhSUB+OzVSI5U3JkQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sdhn.cc; spf=pass smtp.mailfrom=sdhn.cc; dkim=pass (2048-bit key) header.d=sdhn.cc header.i=@sdhn.cc header.b=EubzjMPM; arc=none smtp.client-ip=57.103.72.251
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sdhn.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sdhn.cc
Received: from outbound.ms.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-3a-60-percent-7 (Postfix) with ESMTPS id 37F131800361;
	Sun, 12 Apr 2026 14:19:43 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sdhn.cc; s=sig1; t=1776003586; x=1778595586; bh=MDxYxrSof8t4f40a3KWi0eiFntwsMSzZFS2u2q8Ao8I=; h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:x-icloud-hme; b=EubzjMPM83FuLGJPLlamV8KVOIobdMqdFn+PJbGSp5VnrT7JbuJz0Ehn3jpKenT1F81xaiykFnRk8LPMc8YC9m75bQPYLEphTCMxBvLCOlCWQvTE+hzz/5MAMEQwhFWKHhjcrmUSN4rvK+/RPq26y/rKY70RqFDM8AqgzJSHvryvdi/chiypvv9OO9YqD/VrCGdJQrklW+ESBmYQFQvSOgN5S4Q/Qx+s2aDuF0S/do+mwMnymL8oYc7bM0obFfHcWh/sayc7mn6HuNMMbdrZqU+riNV13Nyv/1PPs0UZghza/RIMc9CQNVQtAHX0BxcvbUwuE0ci+i3gNHc+aP63wA==
mail-alias-created-date: 1772007648188
Received: from sdhn.cc (unknown [17.57.154.37])
	by p00-icloudmta-asmtp-us-west-3a-60-percent-7 (Postfix) with ESMTPSA id 93797180012B;
	Sun, 12 Apr 2026 14:19:38 +0000 (UTC)
Date: Sun, 12 Apr 2026 17:19:35 +0300
From: Mohamad Alsadhan <mo@sdhn.cc>
To: Nicolas Schier <nsc@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Yoann Congal <yoann.congal@smile.fr>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v6] kbuild: host: use single executable for rustc -C
 linker
Message-ID: <iwwybcjzsewhxhgzccdeplkoyxft3g37jogzsijdtxaa3tbxpf@jk7ytyz6nfr6>
References: <20260331000802.380-1-mo@sdhn.cc>
 <adVpQ_ZvXTPUegig@levanger>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <adVpQ_ZvXTPUegig@levanger>
X-Proofpoint-ORIG-GUID: 5slaQOCraqYZwkhfUO94S5qfCKZVnWom
X-Authority-Info-Out: v=2.4 cv=IKwPywvG c=1 sm=1 tr=0 ts=69dbaa00
 cx=c_apl:c_pps:t_out a=qkKslKyYc0ctBTeLUVfTFg==:117 a=kj9zAlcOel0A:10
 a=MKtGQD3n3ToA:10 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=4M8aGtYdH9oeBD5EvBQA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEyMDE0MCBTYWx0ZWRfX1IX3xYaUL0Zj
 BJ4Qb5KiCDVAFtphQzuw+U2eAVBHy8ViLHYGUA/hB5yyqUbVICqtkY2abEjC38xpSNcaqzn8rm1
 dUdf2BfIhbmKuwPKIaAOPoqL5w5XKd1KH5Hj39dzHo0brLEkDx2VOcLKvRBWQjktj1eFTg/nLW1
 uWnK+Fqroi7w1n9wPJwTYwxkzVTejo9Md9wn1tE8d7LBCVe8m44IFU7+fmTUP1BNr2FJATYHQH3
 7rXBJHdWXA2uOSq6/6GtyPa/gXEV7jz7iSXk5jwQVnOQuyePrkOrNHXxtlxqDRkNS16H8rDGtKH
 05yh4ujx/ZrU/Syaef4pPMxokSCZLqC82LIWhHmwEqmvAU8e7IEuTbXhsjjOYM=
X-Proofpoint-GUID: 5slaQOCraqYZwkhfUO94S5qfCKZVnWom
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-12_03,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 mlxscore=0 suspectscore=0 malwarescore=0 bulkscore=0 spamscore=0 adultscore=0
 mlxlogscore=563 lowpriorityscore=0 clxscore=1030 classifier=spam authscore=0
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2604120140
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[sdhn.cc:s=sig1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,smile.fr,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-12765-lists,linux-kbuild=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	DMARC_NA(0.00)[sdhn.cc];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[sdhn.cc:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mo@sdhn.cc,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 699673E4328
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 26/04/07 10:29pm, Nicolas Schier wrote:
> 
> What is the reason for re-adding the 'exec'?

I was under the impression of that it won't hurt, unless I am missing
something.

'exec' would replace the shell process entirely rather than leaving 
it alive waiting for the compiler to finish.

Best regards,
Mo

