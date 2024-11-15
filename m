Return-Path: <linux-kbuild+bounces-4685-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B7569CD603
	for <lists+linux-kbuild@lfdr.de>; Fri, 15 Nov 2024 04:55:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 301DD282B20
	for <lists+linux-kbuild@lfdr.de>; Fri, 15 Nov 2024 03:55:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DC661459EA;
	Fri, 15 Nov 2024 03:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BCgpiOgQ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0062142ABD
	for <linux-kbuild@vger.kernel.org>; Fri, 15 Nov 2024 03:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731642945; cv=none; b=YxWW5lbQ51qDx4FwFYoFNoGBmLN607HdkL4EfmC56Q5wzb/CIG/QzgVLE/WNFlBVwVsO6HNqYtoavSxlLPJwkK7/V0RVLxT2NQbHmFOrZHHOqC4Sc7xagAOdUBbDIpjG3TYkv/TqW6IAIAq2HTB0/exZI7o5DAMqaaeL8tUXICY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731642945; c=relaxed/simple;
	bh=mqk98GP19dZ+Ay7HEP68kLZER2bT/NkIqYTu8jMJ4BE=;
	h=From:Message-ID:To:Subject:Date:MIME-Version:Content-Type; b=FdGJ7K22P2az8Y3b42pIgvOENXit9S3iDPrtE3wH/WzMkb428EaDUvVrf7CGoS2kEhzsDbpcO44szbl15FCGO/uzTZMLFppjbWSenhvjuuDvJVoM1T37VQe6vZ7wNIfwziFXEm0naOTzIAtnIvr8BIv80HgtCfAsoMBy8p5xORw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BCgpiOgQ; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4316cce103dso14714455e9.3
        for <linux-kbuild@vger.kernel.org>; Thu, 14 Nov 2024 19:55:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731642942; x=1732247742; darn=vger.kernel.org;
        h=mime-version:date:subject:to:reply-to:message-id:from:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mqk98GP19dZ+Ay7HEP68kLZER2bT/NkIqYTu8jMJ4BE=;
        b=BCgpiOgQbaYUdKAe773tsGUdJw3DHFFIPiJOYNWsvdg9ioB1DJ8Jh/RQ64HQPKVFFr
         CmhaFevWeh9H54NWXRVx13tYXk9dXQTX/GY4FUG4jP/D/U/haL+kwFen3yIE62EiXhU6
         FR5cdNmfn8OZLH7eJ7G/QrTRz6A25ZqylCBX8GlX3gvLId7erT2+yuqe/NxT0N5LY8hU
         PeXHJXB+KkL7PwS8tewj5AGcyy1YS+9vbXnuF0sb1Gv1cGG9m7xJDRih9b25qXlbuR2x
         pxURyiavcrhzUsm3fuAE3O9CV+NCgC3D9CMtSVJQqse56XQ9vWdV8PjsftIsqtCT2bl6
         GOHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731642942; x=1732247742;
        h=mime-version:date:subject:to:reply-to:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mqk98GP19dZ+Ay7HEP68kLZER2bT/NkIqYTu8jMJ4BE=;
        b=eV4IAHn3tOs4/HYOHG0lAjvu0nCN4WaxwMMXmSx1k9P09eWZqXho+R5bniWLLicHwF
         kwEBK0YhlZt6UwPTTejyNB6b1hlpuHP6b+Rv0g6mXivIxbLEdp9nElO+EB4zVfvEJ8/G
         NZqKtBxhHZ1QLSqgt91RNlPQh2/qpMYHtyPSg5bgiv13p1XeqA7L0Yqt5oAOHlJpKTUr
         5ONScaidvzl6X1PbVVx3GLeGhh5rTqcY66oZqhHFsLNHJOQeP92uWYRLp0umke+aXVe1
         gqdBVxOleNsheHIqEpbfQR6qhZ/bCSIKpy9uURuNLgycZsKe4vx1NVnmBO46bNZrwwqW
         blLg==
X-Gm-Message-State: AOJu0Yz8ePjg5jctCEHgiSlu0miqwRIFXUonbHx1mFHzRtRlOQrqpzmT
	79NwzOqTWEJ2QjNX3mmzmAaR1jaWo+P5dMUNn+bZvbT41JUf+1elTPXhQA==
X-Google-Smtp-Source: AGHT+IFdN1/33OmQ+/GpkO82RwUfMTgc9uSf2k7+7+ZeBRDZcbwsIGp7x+sl/6zjjxN1Uy5d317yYQ==
X-Received: by 2002:a05:600c:45d1:b0:431:604d:b22 with SMTP id 5b1f17b1804b1-432df74fc6dmr10244045e9.16.1731642941995;
        Thu, 14 Nov 2024 19:55:41 -0800 (PST)
Received: from [87.120.84.56] ([87.120.84.56])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432dac0ae3asm39344075e9.27.2024.11.14.19.55.41
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 14 Nov 2024 19:55:41 -0800 (PST)
From: William Cheung <lipyskkh@gmail.com>
X-Google-Original-From: William Cheung <info@gmail.com>
Message-ID: <dced843d67e230b494130f3dbd0ad7ecf887cd5ead9618218189573eee2391f5@mx.google.com>
Reply-To: willchg@hotmail.com
To: linux-kbuild@vger.kernel.org
Subject: Lucrative Proposal
Date: Thu, 14 Nov 2024 19:55:38 -0800
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

I have a lucratuve proposal for you, reply for more info.

