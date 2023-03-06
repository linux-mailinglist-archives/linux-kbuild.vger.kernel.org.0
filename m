Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7A2166ACAE9
	for <lists+linux-kbuild@lfdr.de>; Mon,  6 Mar 2023 18:43:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229561AbjCFRnO (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 6 Mar 2023 12:43:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230179AbjCFRnN (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 6 Mar 2023 12:43:13 -0500
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FA014C19
        for <linux-kbuild@vger.kernel.org>; Mon,  6 Mar 2023 09:42:35 -0800 (PST)
Received: by mail-ed1-x531.google.com with SMTP id i34so42011766eda.7
        for <linux-kbuild@vger.kernel.org>; Mon, 06 Mar 2023 09:42:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678124508;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rWSaTpw91XxeWBUMp2y6yH6fpY5J57mBPQE/rvTfE/w=;
        b=KTQBcA0aKkVcRGcKR57jlWf4RPJ0xo3qVdjiqjN9f2v1LqCkjxRiG84tL/iQh9qe6Z
         NJeeMIXQzjBk/l8OFd4hDl7QQgW670IZJkcViYgJolUAzzoxTzbEBuLOriQGWEpMNb3K
         RWLkUSegtw495RKviXtdu4bNd5XszDhBZpCfK7GJwMyuRBNJSPpDmAGQLLFhK1XToV/a
         ncx/rkB91BW5xGI1IakG8IRILcgKoibtfGZ3HoyyTnsdQaN62eophbukE1y7SLAJsXEk
         mFDn/cKzHbkaIS2duKA6gAj8b/C1yCx06A4HKCjzX4+Pyj2la1BJXNJOVL6bxXZMcABx
         CDhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678124508;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rWSaTpw91XxeWBUMp2y6yH6fpY5J57mBPQE/rvTfE/w=;
        b=xh3NNCccSzoTkd1oOFfLmA4SevcNUATiQQzE/9+0h24eMGzeJK2K6p+dwQy76QMvYy
         Ofr/NbV21a2EIDFGs2iWWI6YZV4mJ91zVf8ktgrkMkkPcU0wHryktcJAFChEcqImW3iZ
         mO79cP/51qllmL0DZZmltQH+mEgyKM1nGNWdO32XkJW5XBJpsbNrALEg7aeMqddDKFid
         OzjIpKeP9paJj0aVnb1+OWReWG/mZOSPvUSGw3W3pHByZ7vuUoHnZcq6f3jKn02rr7Xg
         64jmP9TwtEwxqabKW/FKP3YcMFvv1qetISO5Hz06uKB81LqHbYs/rxlg3UeCRsswchs5
         8SAQ==
X-Gm-Message-State: AO0yUKU5g9r4MhsRJx0LPs770vORggGXANk+e2tIi8u22J9v1Ew3DDgX
        cyzkOwR2MpYkfhuyeMGcF+Z9JvfPZ2XIW6ZC
X-Google-Smtp-Source: AK7set9ZkBq23H+XuxrSyXkXYO/tFz7ho42E36cq4nmb/DDbLuIrBJhexusW7aqjLW64bbvr7FvXFA==
X-Received: by 2002:a17:907:2d93:b0:8b2:2141:6de8 with SMTP id gt19-20020a1709072d9300b008b221416de8mr16006244ejc.73.1678124508289;
        Mon, 06 Mar 2023 09:41:48 -0800 (PST)
Received: from localhost.localdomain ([2001:b07:5d37:537d:5e25:9ef5:7977:d60c])
        by smtp.gmail.com with ESMTPSA id e16-20020a1709061e9000b008bfe95c46c3sm4845209ejj.220.2023.03.06.09.41.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Mar 2023 09:41:47 -0800 (PST)
From:   Vincenzo Palazzo <vincenzopalazzodev@gmail.com>
To:     linux-kbuild@vger.kernel.org
Cc:     masahiroy@kernel.org,
        Vincenzo Palazzo <vincenzopalazzodev@gmail.com>
Subject: [PATCH v1 0/1] emit a warning when mod description is missing  
Date:   Mon,  6 Mar 2023 18:41:40 +0100
Message-Id: <20230306174140.145096-1-vincenzopalazzodev@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

As reported in [1] a module without a description is confusing
and of this patch propose to emit a warning to emphasize that 
the description is important.

[1] https://bugzilla.kernel.org/show_bug.cgi?id=10770

Vincenzo Palazzo (1):
  script: modpost: emit warning when description is missing

 scripts/mod/modpost.c | 3 +++
 1 file changed, 3 insertions(+)

-- 
2.39.2

