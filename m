Return-Path: <linux-kbuild+bounces-3229-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E74E9603BC
	for <lists+linux-kbuild@lfdr.de>; Tue, 27 Aug 2024 09:57:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B10811C20E01
	for <lists+linux-kbuild@lfdr.de>; Tue, 27 Aug 2024 07:57:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C255156C5E;
	Tue, 27 Aug 2024 07:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tradeharmony.pl header.i=@tradeharmony.pl header.b="fP4CneyC"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail.tradeharmony.pl (mail.tradeharmony.pl [5.196.29.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2840313E41D
	for <linux-kbuild@vger.kernel.org>; Tue, 27 Aug 2024 07:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.196.29.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724745469; cv=none; b=I7u0YDpc161aiXXHJLpCu8M0+qvv3uSBnli4c2N5QrpF3vXGcd1ko+ZIzfZNZVfGpKXU4XlpShVtkFG+YBQvXFq9AL4tSAlR8oEmOGARJkaDI48xmTIt2Mtg67FveMMRZ2Y1m01oMvfttBWiqSZ910UjGKBKve53+yH5UgCdz9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724745469; c=relaxed/simple;
	bh=siHX5jVClg4W32F/NjlCmIL8w17yqZEkZP0Dfrdd7Ok=;
	h=Message-ID:Date:From:To:Subject:MIME-Version:Content-Type; b=nE30Ci/HG65UDE6YsALUn3dP9WYKlBhlgaQfeNXJ0FlynPcRLTqi1U0nHMpWxFp4ObMIKa1fOHSUbxZ/bG00IX8f2XZW4A4EJFBNH3qRCVwHBco59K2P7CuForN7gmMJR43VmF8ZZNcaHzT/NNPk1IgRUz28hbuo4tKv3JR4rf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=tradeharmony.pl; spf=pass smtp.mailfrom=tradeharmony.pl; dkim=pass (2048-bit key) header.d=tradeharmony.pl header.i=@tradeharmony.pl header.b=fP4CneyC; arc=none smtp.client-ip=5.196.29.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=tradeharmony.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tradeharmony.pl
Received: by mail.tradeharmony.pl (Postfix, from userid 1002)
	id 91ACA2723F; Tue, 27 Aug 2024 09:56:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tradeharmony.pl;
	s=mail; t=1724745380;
	bh=siHX5jVClg4W32F/NjlCmIL8w17yqZEkZP0Dfrdd7Ok=;
	h=Date:From:To:Subject:From;
	b=fP4CneyCbkoQ1Rf0iHtWco/1gr3KEpU+FytPINw5miCdEMx5EKm7DADvXP4rUuE4T
	 p2VR9ZNm7BRUx0qD3S2J1F+gMrLKLDNSs/SzPOOVfFJY+r3dtLDkykxweT/gGTHDE7
	 N0qO3eTawg8FkGKQjbSAAtIwo9T2Ixc8Jv600hFAiT2uyhlepkH0kv2OIFMCQU0RZT
	 psAhfDopa1WpnrmBam8MPLwOnXzK8gLgEuLtJr0VNCwPkDbKuFAH0TMkdnw46IaZbL
	 lL0jn5N5bkDOVW1pLmG83N8W0K4dXy89aDaOc5O0TQkUBL842FtUJz+F+k6pyZ+yod
	 DLlRfRTTn74UA==
Received: by mail.tradeharmony.pl for <linux-kbuild@vger.kernel.org>; Tue, 27 Aug 2024 07:55:59 GMT
Message-ID: <20240827084500-0.1.8a.2xivg.0.c4rnntbwea@tradeharmony.pl>
Date: Tue, 27 Aug 2024 07:55:59 GMT
From: "Karol Michun" <karol.michun@tradeharmony.pl>
To: <linux-kbuild@vger.kernel.org>
Subject: =?UTF-8?Q?Pytanie_o_samoch=C3=B3d_?=
X-Mailer: mail.tradeharmony.pl
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dzie=C5=84 dobry,

Czy interesuje Pa=C5=84stwa rozwi=C4=85zanie umo=C5=BCliwiaj=C4=85ce moni=
torowanie samochod=C3=B3w firmowych oraz optymalizacj=C4=99 koszt=C3=B3w =
ich utrzymania?=20


Pozdrawiam
Karol Michun

