Return-Path: <linux-kbuild+bounces-4885-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CDCFA9D9FD5
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 Nov 2024 00:48:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8D898281A2E
	for <lists+linux-kbuild@lfdr.de>; Tue, 26 Nov 2024 23:48:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF3DE1DF255;
	Tue, 26 Nov 2024 23:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m+hRykS5"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DAA7D299;
	Tue, 26 Nov 2024 23:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732664902; cv=none; b=iz/fFW+ElJCl/8YZwHpD8sopbTcuGZdP8Epei6HLq2hFi+p2bfg6j0Zgs/sPobL5d4Al8rOc4rqeDM2GvoQexmod1xDm34rk3djdw+0dcF9yB/qkajEbuBd+gxsv9gVOp1WeFHbqI5qfawVIB9VjBY8HRoM+T29c8sNhJXbYNn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732664902; c=relaxed/simple;
	bh=Ta5rSSqWOAYgyYtPNQYMv6vLxlkTW9mLupQ4P8zm8v8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N9YxklOmMnBV0eBOH36SmP6JrWM8eez1y5QAYBDkuHVVnnFLp3iMmbDFli5L7kQEOLJfCWPz+8vemkq0gUOskgBUTo9kEc/BG2AQrF+RM+YbdNu4IeWH9J6h/a/Bppw/8BFjRgxBszA1MJpKiwlKAL56NOtXArPuzV5OeO833fM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m+hRykS5; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-51511a1bd53so1041117e0c.1;
        Tue, 26 Nov 2024 15:48:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732664900; x=1733269700; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lMEIdhd9j4sqMazIV4efJH2qrswd0WIemgUq7Z3wyiI=;
        b=m+hRykS52OckJCVLb1MC4961td3NhNtW/c2iu/mWLcHpx0mZQfXJIh6+TNg5lxDW+y
         SltBqG50AB2ep/Mqy6QvbrwvF6T/2QCBzWlMzcvcrWHSZhYo3DFegn/fpFep0RIX54VX
         +C34EfC72OO2Sbx/227Q7LvE9pvMimEtKKZ8g8WEVXhVn1rm2HQ7a82BzWEaCEC1uVAX
         8fL4qqpnc1yBUNFRvX6PDViqBWZkG7VAovo8brU5Q4UCG+DH6Eq+9BLYMn2PQRCQktK3
         RrS1JGzSUX6vQpLDHGRCecaLRaASygQP/lQbuFx921qHuemioQqKqVXuSbi5Z/GnCTOS
         V/zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732664900; x=1733269700;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lMEIdhd9j4sqMazIV4efJH2qrswd0WIemgUq7Z3wyiI=;
        b=PESqOwy1/I2tMKm/CCPLJYuIiul87nz9LV7MdaqVYqsyrTbrmAaSFotDf2Rari1x5R
         45Zic5rFi2FSkbsOkB7bfD4ngG70rLb6wyRlJ9oH88hq9x0evpJx53m0m5RaGj28SrAP
         TJ7xyIxpGGghp05Ew2204Kym+npgursfNNwVjKX7UD5u6JOexwMrnw4cOw9gzEUkdpsr
         jUHPIrMJmsHa95+xrvwzQ6GmnRZ3aDWUTY496QYuHDNw2x/OMR/X/+4fdfWBQvnD0V90
         PREbnxjY3J9SGa3HCA2s/6Ir44d8XGgPSddCxW8YQRYxIueIHeobQRsSYVA48n0j6ate
         i6VQ==
X-Forwarded-Encrypted: i=1; AJvYcCVsAW3WGcR96DiGyddoPUCvseWOfZ8PT9gQXBZqh/rK/msrorIKVTc0UAzcN2pYtmkNWS5AeOmRw7p+Kdc=@vger.kernel.org, AJvYcCWxFIQxul57xKEqgVFdFFHbpVAx+ZsuuwP2lkX2fuJzk+UBfw3+Pnp+9Vqwu1oDnhmoXW8W6YJWxp5nbFRT@vger.kernel.org
X-Gm-Message-State: AOJu0YzOdDYLRTNFqV4WVfaaEJD+gKu60IjiAC9vU1oL2xvg4sMb0qEu
	KtSqm9dGB/mf4wT/6aIJzitZRzzkWo+7F0aZWd83fwHurxnL+/Ca
X-Gm-Gg: ASbGncssoKpWEnUc870lV7AmaQ802Qx9ziwUcyUtUYDUNcA25himdsin1iWmSnhI2H0
	QJRtKZs040WnOOmXj6PLHKAjmrRxqM3KuYc3GfeuXyfiHqxvLowOmYTVW2GPFEsieml6/7Bqt42
	rMvrZrtg329WaieViUabDTsUjBSF4evIIAyoERuVOI/I7Ip89+N7e7UKpQTkT5mkc/gwBl30n9t
	KMlm8avQfrtzeYajE4hoBo+ZJoZ0LEOxoiIz90HD0+ktpMreUve33Wj8Af59oN8GDuLO0y0vnMt
	hYnA7i88lS7ttLe1t80bvwxZpGkdQy0=
X-Google-Smtp-Source: AGHT+IG/gvczddX9ejiORBt2BuAgcHmXM/cHPcvEcZnnyDl+r0ApMLRv3LIsK2IR2mc1WhfQ29+wcw==
X-Received: by 2002:a05:6122:218a:b0:4f6:aa3e:aa4c with SMTP id 71dfb90a1353d-515569abc33mr1917995e0c.3.1732664900106;
        Tue, 26 Nov 2024 15:48:20 -0800 (PST)
Received: from localhost (57-135-107-183.static4.bluestreamfiber.net. [57.135.107.183])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5154445064fsm317518e0c.10.2024.11.26.15.48.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2024 15:48:19 -0800 (PST)
From: David Hunter <david.hunter.linux@gmail.com>
To: masahiroy@kernel.org
Cc: david.hunter.linux@gmail.com,
	javier.carrasco.cruz@gmail.com,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	rostedt@goodmis.org,
	shuah@kernel.org
Subject: Re: [PATCH v2 2/7] streamline_config.pl: ensure all defaults are tracked
Date: Tue, 26 Nov 2024 18:48:13 -0500
Message-ID: <20241126234813.1602902-1-david.hunter.linux@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CAK7LNAR8TQx=r-esfi+dJ3=TQ+6Om+LPadhDPqn3TLH93xi4WQ@mail.gmail.com>
References: <CAK7LNAR8TQx=r-esfi+dJ3=TQ+6Om+LPadhDPqn3TLH93xi4WQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: david.hunter.linux@gmail.com

There are many instances of the second line of a config entry containing infomation about defaults. Here is a summary: 

def_bools found: 746
def_tristates found: 59
defaults found: 169

> Can you list some examples of where this happens?

I created a file that finds all the times that a default information is given in the line following a CONFIG entry is created. Here is a link for the output, which will show the file and the line numbers: 

https://github.com/dshunter107/linux-tools/blob/main/localmodconfig/defaults.output

If you would like to see the shell script I made to find the locations, you can view it at this link: 

https://github.com/dshunter107/linux-tools/blob/main/localmodconfig/check_define.sh



