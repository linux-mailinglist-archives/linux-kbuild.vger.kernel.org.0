Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3B91EC96E6
	for <lists+linux-kbuild@lfdr.de>; Thu,  3 Oct 2019 05:18:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728477AbfJCDS2 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 2 Oct 2019 23:18:28 -0400
Received: from mail-pg1-f171.google.com ([209.85.215.171]:41790 "EHLO
        mail-pg1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728457AbfJCDS1 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 2 Oct 2019 23:18:27 -0400
Received: by mail-pg1-f171.google.com with SMTP id s1so827925pgv.8
        for <linux-kbuild@vger.kernel.org>; Wed, 02 Oct 2019 20:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:user-agent:date:from:to:cc:cc:subject;
        bh=a0y9Oz9jCFEcpxMH+brpGYKXBHpa7Nob5ArPYG6RvmY=;
        b=ZW1VAyHKorimP8sGU/YH4uX9OnJz7V9EvB/dAxp+sDJtCUk/OG+PeFXnmCaxQH1xgU
         VOMXN0hNTLxznO9sXqppHhX5MT9u3qwLS4L4nhmtdw+9APyqV3VkW8ifxVykeDrIlhXb
         z4Q0CQkoXB5hMRk8qKW5vHxsHVJwN1VLjIXT5Tt35G//BTHff+BSuahN6OWmYFy0SPIg
         THKu5ALYc4SJWxfryfltVMAcPsZFrr3KtxDkDujKWHAbRSqmHLcg9oKmv7LLu/hnQDbi
         brZYFUSokGejS/hHLEONacalb/I97YNuJA2nUh8kU50Zb+wDibS+dGsoove3F9jhsjVz
         BvmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:user-agent:date:from:to:cc:cc:subject;
        bh=a0y9Oz9jCFEcpxMH+brpGYKXBHpa7Nob5ArPYG6RvmY=;
        b=C9mc/WZj1uBMHX1JZ5ZM3v8qQ5KjH7hJimVSijZ5ive0frQE5aKg96H8gy5ZDDFSz/
         zPWXERe4dlV1MbB6RsJP6ZpDtIdgPGc1PG8Hm/HVNAuPs23Ag92z64v1PteJbuNpPhuu
         NuFlkjFk0lsHwX9tI2Qj+oG2wUrmE7hQ8JWM2l1jNfim7lBVj+9gCezzYv/KxBl0ct2S
         Xf4i0h93BdqWsq9SxxSyaW3nEoHVtsU1Rzwfpw7YDuTFHRM7qsX+NrLlvU74Rpj93kf9
         jO8PLHsWXaFlBk+7i180SGKhmD1ozbfZIYj7/IM2VMSBSUqilYnTQ8St0eH6wnsUY2eO
         Iicg==
X-Gm-Message-State: APjAAAUc+7GSFWrJAnHxZRJPVb8yMGMlfJvSIoEgmDJxfyAoH7Nzk2sk
        TrE2QfmvXdtQZBqao5EYWlgmvtcr
X-Google-Smtp-Source: APXvYqwaTCkMkcYsa2RFd1xBNgzx145EgUrN/ccZraMaKZh7x5WBShZRWXNgf6Rj9KB/rIeU2q8mxA==
X-Received: by 2002:a62:5a85:: with SMTP id o127mr8760734pfb.212.1570072706738;
        Wed, 02 Oct 2019 20:18:26 -0700 (PDT)
Received: from localhost ([2601:1c0:6280:3f0::9a1f])
        by smtp.gmail.com with ESMTPSA id a23sm701480pgd.83.2019.10.02.20.18.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2019 20:18:25 -0700 (PDT)
Message-Id: <20191003031312.157994411@gmail.com>
User-Agent: quilt/0.65
Date:   Wed, 02 Oct 2019 20:13:12 -0700
From:   rd.dunlab@gmail.com
To:     linux-kbuild@vger.kernel.org
Cc:     rdunlap@infradead.org
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 0/4] scripts: update namespace.pl
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

This patch series updates scripts/namespace.pl:

1/4: handle rename of lib-ksyms.o to lib.a by scripts/Makefile.build
2/4: add a few x86 object files to the namespace exceptions list
3/4: include trailing ".o" in the namespace exceptions list of
     file names and change/fix "acpia" to "acpica"
4/4: add a blank line to separate a section of the output


 scripts/namespace.pl |   48 +++++++++++++++++++++++------------------
 1 file changed, 27 insertions(+), 21 deletions(-)


