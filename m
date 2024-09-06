Return-Path: <linux-kbuild+bounces-3417-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8854B96ECFE
	for <lists+linux-kbuild@lfdr.de>; Fri,  6 Sep 2024 10:00:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3CC991F257C9
	for <lists+linux-kbuild@lfdr.de>; Fri,  6 Sep 2024 08:00:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CACE3208A0;
	Fri,  6 Sep 2024 08:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tradeharmony.pl header.i=@tradeharmony.pl header.b="NNud5UTq"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail.tradeharmony.pl (mail.tradeharmony.pl [5.196.29.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 787B01A28C
	for <linux-kbuild@vger.kernel.org>; Fri,  6 Sep 2024 08:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.196.29.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725609651; cv=none; b=CNWY80VFgIPObFUTsWZoreVZ8gRveXsmzd3xG2kRi11UDiIDG9PvaG2fk7Pc7YM025S1jM7C0G/HQpP17CkXKlxu99/JUq4kI7x3VEk41Mbv5aqaYIoxK1im6v4Ts+ZjTIi5FXME7H7H+VG6EacWEUDMy2IwZ+ZI4BvQR2/aejM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725609651; c=relaxed/simple;
	bh=siHX5jVClg4W32F/NjlCmIL8w17yqZEkZP0Dfrdd7Ok=;
	h=Message-ID:Date:From:To:Subject:MIME-Version:Content-Type; b=JDU9A3iGSa3Vl2qY/V3iEkvCeLJWbeBAFgaIz6/xSNXvksjTP3F62sb+EeLkclAV7wGngsPgwyYw8F4V1cQ1RQSF6CPkf3BJ6yqEGdatD5ttLUh1aVPdaZI4ZH5bnzRWazr3SZHfkax0G7Yjx2t0+iMkRMkqXW5dmMbVT0Kjby0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=tradeharmony.pl; spf=pass smtp.mailfrom=tradeharmony.pl; dkim=pass (2048-bit key) header.d=tradeharmony.pl header.i=@tradeharmony.pl header.b=NNud5UTq; arc=none smtp.client-ip=5.196.29.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=tradeharmony.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tradeharmony.pl
Received: by mail.tradeharmony.pl (Postfix, from userid 1002)
	id 12BAC277D5; Fri,  6 Sep 2024 09:50:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tradeharmony.pl;
	s=mail; t=1725609060;
	bh=siHX5jVClg4W32F/NjlCmIL8w17yqZEkZP0Dfrdd7Ok=;
	h=Date:From:To:Subject:From;
	b=NNud5UTqcabQgyS6Qrd5IXk0xCpBMd3WEwoZCy2gFpsx9v+ofjwY2X8ufgRhOy+pp
	 qDFIMHMndqUCQDRAqLRYrbWo+siOwXaKelNBjlojxMcj6fPzHASd5XUrMJ636Vtp5e
	 MLxdNly9KFi0Me4pSAxizJR9WlH1jxA98fwKUbrWwCJc4UbSiQnrIORU64q6sA9uSj
	 GPENzMaClsSNQl+X268efCKeqe5cHvzuRpzRTYOYI8Z38gqAjiAvNfCxx56+sZ4pOS
	 G6fxaVzZudOn/rqdIHA3wkHc/pvYPkLPwLUWNCVWbyGy59WcvsS1089a11moH7pG9O
	 D//FyVMhNm1Dg==
Received: by mail.tradeharmony.pl for <linux-kbuild@vger.kernel.org>; Fri,  6 Sep 2024 07:50:32 GMT
Message-ID: <20240906084500-0.1.8i.2z8oa.0.c0h3e6tjip@tradeharmony.pl>
Date: Fri,  6 Sep 2024 07:50:32 GMT
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

