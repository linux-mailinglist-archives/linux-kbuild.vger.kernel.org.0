Return-Path: <linux-kbuild+bounces-3539-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE1F5978678
	for <lists+linux-kbuild@lfdr.de>; Fri, 13 Sep 2024 19:13:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 237311C23149
	for <lists+linux-kbuild@lfdr.de>; Fri, 13 Sep 2024 17:13:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02EC984FA0;
	Fri, 13 Sep 2024 17:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M+uvKpst"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7443584E14;
	Fri, 13 Sep 2024 17:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726247562; cv=none; b=ggY4D43ET6HP+H3v1+Jlj35Asks7/8qDH0eDb6VbfBXByhGqtiJafDx++zghu90jPaUUDDl6Vl6jhcbpEoPWrUWLd3QAYe348xWkqOJSkogg+nnacPDSrLqIJSGqpD5s7zLqXEb8kbGvG1zews4+g0xrseld9CNn6b3a5F62n1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726247562; c=relaxed/simple;
	bh=2PuKDWXgJpjBk9CDwbD0GM6AxbKOkBxN66BpmL4XKBY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mCyGFtZDuwA3HsSW37Cg+YWrdXyHTRE84fB6ZNF+y57YPNt2kGe6qVWUp8geVLekiYwXRbpzwme2zidqt7rqVWBDq3XOvYRyHNQQ5zyLsmTHPmiLoRJgugdRGXfjYzxVlX8gD03XOS6Eg0dda4DM5wHL9LWHHeMVLWDwl6X+i+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M+uvKpst; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-6db9f7969fdso19961977b3.0;
        Fri, 13 Sep 2024 10:12:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726247560; x=1726852360; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Z1VhSdcP9ko/rAeK53mf5eEs2n8E25Al2LdRBjlHms=;
        b=M+uvKpstk/Xrxp0sgPKmwiu0WrWBZUj2+w+SGd5eVeFfXGmj+6gxHeZnOAxwwsIiW1
         PkOg6KDelYw+I2FIZza1pzR8AcIcFbtmC1PnFavczA7Hth7jU3u3FQkipknZrMcEr0ec
         R1/rnB110vNbw1OY9Rx8rrtWBXLEP8faiQVicccgICcbsbnvSTdXxGCLfzKmx8OiWDGG
         5/UJLm5UN42oh8I6kjOUtV9EijD6uj/T2gqu5kVQ0LrMs256LWiq7ZC6X3tQ1j47t96U
         MaRbZnNMyTy4M0VeS8Gq3bRh6bNYCnVneZaRMPRzmK3YGwA0MqjXLo5qPlOV6d9J+iZZ
         UzOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726247560; x=1726852360;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7Z1VhSdcP9ko/rAeK53mf5eEs2n8E25Al2LdRBjlHms=;
        b=ogjhNKwTMlVeWfstKjdbUreHXPT70PMEV86i/19bnG9jz+7cxb3ANIwKG6RzBe/P3g
         AAphBecSh3dTPf8FsGdSX2DONA9Smup83fAzowxoH70itVWQPrwLzaOKf+9K//TuLoR2
         XMBXP+uTie9cc6KWUMrVd+KYWRyC7sFhg/VH+DQVcvSC90ee9eRhzyBAGSazhx0G6LsA
         il0S/iNR3X8LmeYtkq8jDV2U6dhXzEGxYnjVAFJbtpoCOVXgjz6oKQE7WJIh08gSWdKT
         jkhg5gPKhGdswrquFfzr10Jf1x/6LMwpmSfPcYlKsylRL4tpuAwga/2LG/AU+iORiltb
         B0Ag==
X-Forwarded-Encrypted: i=1; AJvYcCUUaqvXvU+k3t1O7FUYiwBzyIBY57fQVN6HWaO5KPYD5YQUkt/t0Xf2WycdITcVgoSyOTQp4j32OxPQUecl@vger.kernel.org, AJvYcCV0DZ1urt617/ofZYUOeis9E08863RXdLyyTfS9EIZaEcQklGBgKsGNDS0L8trmHan5sI3yGShwOSe/qbo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKZ8m/HEF0bGbghljkmxy8CNeYbdmp92VRBHxNkpUtQ1u0Dm/0
	kK5fkHf6EgJWypfZgNSNmKKfMPJkrGN9yzMdC9No+X1/W87nn5D6CJFsow==
X-Google-Smtp-Source: AGHT+IF8ddnaLbOh/Kr2qZrSb3wZkZO7UXfAKc0RSIDuFTMgS6ShbK7fvXxYkPiGhxpUJJ8cyzZAqg==
X-Received: by 2002:a05:690c:480a:b0:652:e900:550a with SMTP id 00721157ae682-6dbb715b1bfmr60094077b3.19.1726247560268;
        Fri, 13 Sep 2024 10:12:40 -0700 (PDT)
Received: from localhost (57-135-107-183.static4.bluestreamfiber.net. [57.135.107.183])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6dbbf1f38fbsm5779237b3.22.2024.09.13.10.12.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Sep 2024 10:12:39 -0700 (PDT)
From: David Hunter <david.hunter.linux@gmail.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: David Hunter <david.hunter.linux@gmail.com>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	shuah@kernel.org,
	javier.carrasco.cruz@gmail.com
Subject: [PATCH 3/7] linux-kbuild: fix: ensure all defaults are tracked
Date: Fri, 13 Sep 2024 13:11:58 -0400
Message-ID: <20240913171205.22126-4-david.hunter.linux@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240913171205.22126-1-david.hunter.linux@gmail.com>
References: <20240913171205.22126-1-david.hunter.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Track default options on the second line. On the second line of some
config entries, default and depndency options sometimes appear. In those
instances, the state will be "NEW" and not "DEP".

Signed-off-by: David Hunter <david.hunter.linux@gmail.com>
---
 scripts/kconfig/streamline_config.pl | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/kconfig/streamline_config.pl b/scripts/kconfig/streamline_config.pl
index ddc630f2264a..bb1f19a1ab5e 100755
--- a/scripts/kconfig/streamline_config.pl
+++ b/scripts/kconfig/streamline_config.pl
@@ -220,7 +220,7 @@ sub read_kconfig {
 	    $depends{$config} = $1;
 	} elsif ($state eq "DEP" && /^\s*depends\s+on\s+(.*)$/) {
 	    $depends{$config} .= " " . $1;
-	} elsif ($state eq "DEP" && /^\s*def(_(bool|tristate)|ault)\s+(\S.*)$/) {
+	} elsif (($state eq "DEP" || $state eq "NEW") && /^\s*def(_(bool|tristate)|ault)\s+(\S.*)$/) {
 	    my $dep = $3;
 	    if ($dep !~ /^\s*(y|m|n)\s*$/) {
 		$dep =~ s/.*\sif\s+//;
-- 
2.43.0


