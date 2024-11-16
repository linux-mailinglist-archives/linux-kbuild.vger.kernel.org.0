Return-Path: <linux-kbuild+bounces-4699-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FA5E9CFF9B
	for <lists+linux-kbuild@lfdr.de>; Sat, 16 Nov 2024 16:40:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E04F61F22759
	for <lists+linux-kbuild@lfdr.de>; Sat, 16 Nov 2024 15:40:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6011954765;
	Sat, 16 Nov 2024 15:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a+cpzBVF"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0559A80BEC
	for <linux-kbuild@vger.kernel.org>; Sat, 16 Nov 2024 15:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731771637; cv=none; b=LfoA0r23eUcYqP/4uxigV78sNenl5fppmFoU5SIXo5lfWZGoLj791cMPBaxUzf97D0ItLxi7WTv9E57hiXTgc4ZpkLVl8209VyOXH25YbHiugVseZQ630C9elpXkCPvoJ3ojG4k66dVs5DuCPLsC5OFJ/ApYr1HVMWEhwPrFomw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731771637; c=relaxed/simple;
	bh=Wd+7kLQISUZlzyPvYmSUTVOb8NV4Vyd3OpsFXw6X7a0=;
	h=From:Message-ID:To:Subject:Date:MIME-Version:Content-Type; b=cp4XGu18ltXcglcgEof0S9ePLKGBVkN7F6KppojtOuupzn8OTwzM81EYEm4FI8w2+D+fHHJx/H3TBfHhYLaJQO9n8mViPkodjr3U5Wsp/gDJFK9qOawBEnal6+MNs/QSBbotrNgMXAzTmlPWabVTaQ2VdfNzRDHGuCzs+MiysC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a+cpzBVF; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-71e79f73aaeso2130546b3a.3
        for <linux-kbuild@vger.kernel.org>; Sat, 16 Nov 2024 07:40:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731771635; x=1732376435; darn=vger.kernel.org;
        h=mime-version:date:subject:to:reply-to:message-id:from:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XHEOkgJ64rwJ+cv0sVIqPUmbc8l+iTifR7HzGzNced0=;
        b=a+cpzBVFazTzIWiDM4HQZm9cyz/WGvHFIUafqmtJXjkfRo03JnNoqcfncLv1tP7bsv
         6ybMv3ZvcTIu+F/NHv8LItApqLgtuVI3KcZNZWEX+dTH6IPpCrqVahnBcegrOM0KJn61
         TYPjDF/rACj71hikpY9R2yBmAJbD6INaST/x+lw1oFMCSCPlnlf+R1v5L4lELrBdKf5t
         vV0ymiIYniDUK6T/OYHdruM3VR4jcbIAr8uwjfX75v27jImJBPBYKV2cm/3X9LPQQUn2
         qk82CsPy8P1c9uK4ZUrIgX61ic/iQOijzsNOgj30ypn2vNceE1BZW5f8GXw+s31tkZIc
         XUEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731771635; x=1732376435;
        h=mime-version:date:subject:to:reply-to:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XHEOkgJ64rwJ+cv0sVIqPUmbc8l+iTifR7HzGzNced0=;
        b=Vzg7yyas2NHdPXWItYltxlvs/cpbzk/2+J1mYjBbbnw0KY6bZS893hOFy9GVD21R3q
         1J4SroICJ4/LmIVyoXMBvrWytVYJ0S1ZDecX+zZNkJZLDdkKzXX9yvWOtw9F/Byes6fK
         4ta2JcuiRrmqpHpnXJfocqWhYcMZ7pQvax8AXz2OKCuTmJSEaM5q3kvnL5mlFk/I7451
         85j6v7le9jCzuRDauq8cmS4/HGzmrtb9F+cXqtWNQF0J7BiI92pG1lBMltaWtJXjhuiP
         ycxCR4opUpifaxEaEdB3mn6phLZLAIJtq3Q1/0p+5q+QUG8+D4W38i92ky6buTqwglkE
         sP1Q==
X-Gm-Message-State: AOJu0YyuLQWdOgAib0reRo8HtCLWSDWb8D74Imb0e+Ch9yV4R+bSoleh
	7zgw0fnoA1CU5RlyAh6lhH+jZ/bVOFxkoFe0qaNcdlR8CI0EAI4mdHpv
X-Google-Smtp-Source: AGHT+IGz7WqGcaKV+wikw+lSWbcUUuoggNuI/29K0tSI3xxerPNShLNQ6W2htXW67V4zjqIFUubXmw==
X-Received: by 2002:a17:90b:1b45:b0:2ea:6a9:3351 with SMTP id 98e67ed59e1d1-2ea155227d2mr7120603a91.21.1731771635208;
        Sat, 16 Nov 2024 07:40:35 -0800 (PST)
Received: from [103.67.163.162] ([103.67.163.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211d0f345c0sm28856315ad.152.2024.11.16.07.40.34
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 16 Nov 2024 07:40:34 -0800 (PST)
From: "Van. HR" <madinaradjabu911@gmail.com>
X-Google-Original-From: "Van. HR" <infodesk@information.com>
Message-ID: <a56e712e53bbde3a6279c41d19f98dc9ba177904b36fc316b73c32be6a0f89f4@mx.google.com>
Reply-To: dirofdptvancollin@gmail.com
To: linux-kbuild@vger.kernel.org
Subject: Nov:16:24
Date: Sat, 16 Nov 2024 10:40:32 -0500
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

Hello,
I am a private investment consultant representing the interest of a multinational  conglomerate that wishes to place funds into a trust management portfolio.

Please indicate your interest for additional information.

Regards,

Van Collin.


