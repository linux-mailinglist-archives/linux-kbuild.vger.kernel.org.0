Return-Path: <linux-kbuild+bounces-9060-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A2A6BC7ED0
	for <lists+linux-kbuild@lfdr.de>; Thu, 09 Oct 2025 10:08:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 50B851A6065B
	for <lists+linux-kbuild@lfdr.de>; Thu,  9 Oct 2025 08:07:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B1F02D97A0;
	Thu,  9 Oct 2025 08:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LA+JXcM2"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63B432D979F
	for <linux-kbuild@vger.kernel.org>; Thu,  9 Oct 2025 08:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759996980; cv=none; b=t3RtOh2YGUH4PEZ3zP/A3/xhAF0LdRoC8LEcTgV2WAEZ+JFIwthNniSyMKhDwV/aoiLiUmgu0StO4eLC1BsoHJRLPMzhmmTOxOh8CoLqRtVT1rS5PtB99xATXuHpVBemoh0rDG77gZGiR5LRIrap0c4cDWuiT9Jjl8wPnoltvjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759996980; c=relaxed/simple;
	bh=K8tOls+YuUMbAJn57FpEQBFXdO/h3ArpWBRwCguKFNQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=to2QZuOyaKxVYRkwnU8hQj3FVDHC3aOu1mrIKSNghQvHmWQBXavn44nRWAAxHsZABNMILWP5MbIhGfHFKBwdaj9oxrYwUYs5AspOSrqVnJYHeJWqVvILCMZ3wAQj7kvwOwtp7lNnrVkqz3YDzQHw4SbxmPaUgPLWCN/gS9oJCF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LA+JXcM2; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3ece1102998so384021f8f.2
        for <linux-kbuild@vger.kernel.org>; Thu, 09 Oct 2025 01:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759996977; x=1760601777; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nmgZ1stJzO0OXNGhzzc20pBZnkzJWTSFXL/OwU1NfN0=;
        b=LA+JXcM2mnYBvjJQEJrG8uS3chyIqiTX1MTRFTFHaqiNMTJvdKu28M9xmaP5lwt5l/
         +7ZktW0TZcINRV7ljlJkuMJcCvepFrvusrsnbaLX9u8ZJGLGpSZe5syKkovR/HA1scVp
         jNVGQcOvO2exIYe7sNDzJpG1gumKUFs9RO9cHc1S/R+N5Syp73Dz6eXYcT0aGaF3i9lF
         KBIZwN29vudkMFSFjSVKzEudy157ipCWnWun1fY90eF8mGlE9xCqwt7bYMnE3iQbVq57
         Z6u+Vg9efOCBOLOt3R3N+c73X05l3hh0mDxsPzvsirlt5TYjme5WRAetj8mgicpHN5Eg
         KvEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759996977; x=1760601777;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nmgZ1stJzO0OXNGhzzc20pBZnkzJWTSFXL/OwU1NfN0=;
        b=l1tmiZnw83afEXEAk5TRr+buIRfeT/GELNpEQKqN0ezRc0PhmUsxinHrFlmv6i5DtR
         nbh+5WzSqCLcw8Ubn5TQF8hgcrAAUh4a6+Ao03vMXbYDnVXMkitFBWMzR1CzSykGCYMc
         /iPq7BfhEYHXPxdmXr9l5FmkVc03VW6zok20qbF6suVYwQfynqKG7WfV7ywOeSwEg+hc
         v212Ak4Rwkg6SHNfb0Yf3tssXYz65YWfSXg8Jf562du87qgJ/aYtUFEEtgdJo4IKsg+0
         cHkZmmoIKcaciJmyrxbeaRnQr2QhBt1osXehqRgaBWVxSxaxBXer50f03b0eCwPKkKbt
         4ktw==
X-Gm-Message-State: AOJu0YzlYumf3CuVXfwxlDmwjl3bp9rfzk8AoFGq5oRUtrrkuz6ta9IA
	gbtfrOvRmlhZz8WBNmIoIsfwYFjw8r/fhrtIcG8DIQAhr1RbR7b36g6A+rcVIm0l
X-Gm-Gg: ASbGnct0LJ948sxmm4odxKdIRsrZA0W7jyM7kDcul3kIJ1Q5JN/JwWtP1zXDqfa3GCQ
	wsGbnTyN/NKGe2tYgJDRISmNn/kWSEAEV2deutSe77VMKjtFGGgpuipltPyAevp3RizwNOyAja2
	A3Fj9/cYTVdzNgws1GLI6efovmfv3GNe0YxdwGeXEgNZMtLrNFXhabGek7FqOlfy8ap9KsFjjX1
	Qub3VwY0BR7lY7sdFMPKKZZCaik5OyCN1cNtiUfU0YzNWrIGEYyM8Ogmn88o/fHrH1BdudX1PoZ
	LLOgh9YOQeSnwKGjrPjVkaBXElMGtKvBqdZa4UAff2HRLvWZoIQJypkSGaq7eMocMM3Gd1oeL7a
	mNsau9DeyY9Ds2qkrm85KoIrG10+1Rky3wOmDaL02rzU=
X-Google-Smtp-Source: AGHT+IGzzMQT0+Q4KC5cr5OVvpL7nF2Kx6VgeouWeY1dugB8ebtVbkbcg1MO5oNHGLNrWpLIfhYvqw==
X-Received: by 2002:a05:6000:430b:b0:3f0:4365:1d36 with SMTP id ffacd0b85a97d-42666ac9d80mr4139943f8f.16.1759996977400;
        Thu, 09 Oct 2025 01:02:57 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4255d8e96e0sm33432337f8f.33.2025.10.09.01.02.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Oct 2025 01:02:57 -0700 (PDT)
From: Askar Safin <safinaskar@gmail.com>
To: linux-kbuild@vger.kernel.org,
	regressions@lists.linux.dev
Cc: dxu@dxuuu.xyz,
	linux-kernel@vger.kernel.org,
	masahiroy@kernel.org,
	miguel.ojeda.sandonis@gmail.com,
	nathan@kernel.org,
	nsc@kernel.org,
	ojeda@kernel.org,
	sam@gentoo.org,
	thomas.weissschuh@linutronix.de
Subject: Re: [REGRESSION][BISECTED] kbuild: CFLAGS=-w no longer works
Date: Thu,  9 Oct 2025 11:02:50 +0300
Message-ID: <20251009080250.1089826-1-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251009075149.1083040-1-safinaskar@gmail.com>
References: <20251009075149.1083040-1-safinaskar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The bug still reproducible with current kbuild-next (2ea77fca84f07849aa995271271340d262d0c2e9)

-- 
Askar Safin

