Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B38FC1C70D9
	for <lists+linux-kbuild@lfdr.de>; Wed,  6 May 2020 14:52:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728296AbgEFMwv (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 6 May 2020 08:52:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728081AbgEFMws (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 6 May 2020 08:52:48 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1764C061A0F
        for <linux-kbuild@vger.kernel.org>; Wed,  6 May 2020 05:52:47 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id x73so1242144lfa.2
        for <linux-kbuild@vger.kernel.org>; Wed, 06 May 2020 05:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=unikie-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KVS4mK2LGdm5yq0dAuyLv6+o5FRfKioNXBJzTeiUGUE=;
        b=yUvhHnotvXq1X0hRtaEhzl8msJDtyLAKhuVZSaa50P5JdnBb7RlF//QdwFkJyENehU
         NiNs7BQj03qmfRA+2FDcJhdTLU0IIBKs15ZN03aR/cFcfvUlRhLZBYEeKktNhEAtQkf2
         M+5I/UZ/tj+KxcoS2rPpzuNugl9unaSBoGNMhWdw+34MgiNoujsizql/5yxvJcoLGLE8
         HXXZqQLAF7Rgnfe9vI5Yg8x+xFENyH2hf3XifFlZjp9Dyq48BoEFtGW5iPCLYnhF3LdS
         ODrc7cRpjyuUqBCzkr49Vk+3PaAyWA1tfgXoTRyGoYHEP0TQQUyCkFfMLG9Y21S0B8Tv
         vf4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KVS4mK2LGdm5yq0dAuyLv6+o5FRfKioNXBJzTeiUGUE=;
        b=p/hUYcc8aezNdd4JQNJNu6gU5THDPn7IGmujKDHKM37ChtlxBlYIj6H+Xz0akwYI79
         xPF5XHk93Rtdp0kklV2QGJ4BIW8ISTum4p8aw0H9F3qQDYoqog49FSG9lGjKH0Mn0ajf
         K+pcbUMa0dlDWZf27iSm9o0ZOm10485CnW3ccYsKwEP1dYrxqvqBmcgAVSFWyk44DlLC
         Vai8JU565sG/4WrWCZ1ViP456d/6NQOLDH8wn61If4PKHrNIPjM1lWy6gyhSNpjG1lMT
         cgEuXzxpU72PeFgtDROPFDvFa//nACdUEsGwidCQMJ1tzdanpLqiN/MHRiCa2/JJgwwx
         xwEw==
X-Gm-Message-State: AGi0Pubrjhz035rLFXYnOUDju+8Lz8h/vP7nk8mWlQe2x0oXOmVUj7p4
        Iiz2EDQKwyYfA8SDkPYTQIo1ub4t90xoFMKe
X-Google-Smtp-Source: APiQypJijtpIPso9JS4zMY42zm+jmtoFZBIiR87/2zwROSVpzflEII+P51RIXt22EpBZNZMStCIIoQ==
X-Received: by 2002:a05:6512:10c5:: with SMTP id k5mr5124627lfg.0.1588769566164;
        Wed, 06 May 2020 05:52:46 -0700 (PDT)
Received: from localhost.localdomain (91-153-194-104.elisa-laajakaista.fi. [91.153.194.104])
        by smtp.gmail.com with ESMTPSA id o204sm1578670lff.64.2020.05.06.05.52.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2020 05:52:45 -0700 (PDT)
From:   Jukka Kaartinen <jukka.kaartinen@unikie.com>
To:     linux-kbuild@vger.kernel.org
Cc:     yamada.masahiro@socionext.com, lukas.bulwahn@gmail.com,
        jouni.hogander@unikie.com, dan.carpenter@oracle.com,
        Jukka Kaartinen <jukka.kaartinen@partner.bmw.de>
Subject: [PATCH 0/2] [RFC] kconfig: new command line tool to set configs
Date:   Wed,  6 May 2020 15:52:34 +0300
Message-Id: <20200506125236.16415-1-jukka.kaartinen@unikie.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

From: Jukka Kaartinen <jukka.kaartinen@partner.bmw.de>

Me, Jouni Högander and Lukas Bulwahn are working on to improve
syzkaller with configuration bisect
feature: https://github.com/google/syzkaller/pull/1689
For that we need to set kernel configurations without human
interaction.
Currently there are no tools to set config options on if it has 
dependencies without human interaction if dependencies are not known beforehand.

I found this old patch from Dan Carpenter 
https://patchwork.kernel.org/patch/6387181/ that can handle the 
dependencies using only commandline and with a small feature added 
it can be automated to say "yes" to all dependencies.

Dan Carpenter (1):
  kconfig: a new command line tool to set configs

Jukka Kaartinen (1):
  kconfig: Extend kconfig with setall option

 scripts/kconfig/Makefile |   7 +
 scripts/kconfig/kconfig  |  83 ++++++++++
 scripts/kconfig/lconf.c  | 328 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 418 insertions(+)
 create mode 100755 scripts/kconfig/kconfig
 create mode 100644 scripts/kconfig/lconf.c

-- 
2.17.1

