Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A571276EFC5
	for <lists+linux-kbuild@lfdr.de>; Thu,  3 Aug 2023 18:41:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237330AbjHCQl3 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 3 Aug 2023 12:41:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235583AbjHCQlK (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 3 Aug 2023 12:41:10 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01EAD30E2
        for <linux-kbuild@vger.kernel.org>; Thu,  3 Aug 2023 09:40:52 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-3fe426b86a8so4786355e9.3
        for <linux-kbuild@vger.kernel.org>; Thu, 03 Aug 2023 09:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20221208.gappssmtp.com; s=20221208; t=1691080851; x=1691685651;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lX7ZmxV6sUKOfhm6A9JqnUZ04X66QXptGmyw3ia1hSI=;
        b=dYzjHKoX9HMc0OZquV/tdH8XUpfDXAFCPBRDVrypHihgyyf0XpYYM6ToFd76CDqBEh
         +oJF6kWgvS14RHWLdb8X83GZ66CB1CwpHopYIZ+iOSS/g7n5cN8NND4/eteXet4ABJs/
         YHXlZlIpOyvzxmfDEmenByGIm/WDlY+5dttKb0ImYPO+jsYKswe91CWN31UPnuWpErNH
         lcP5SEh8r6W0fKsFx7xUsHqRw+WUFESEeyiw6A/WpN8TraDz2Ai5DoeFz/B0KU9DyTec
         lLzaNGuyAE1w4LQN9QZWMkrLgCU8BxV1tYCQ++occCaVhMjobXArfnTckIMvycoyXYG6
         nbzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691080851; x=1691685651;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lX7ZmxV6sUKOfhm6A9JqnUZ04X66QXptGmyw3ia1hSI=;
        b=TaDtueMKRTXiV3uVe3/kNyUFmdd88YPpN4ygrtDmZfwT38cznJ1s4EVeEmQGhacaZM
         pzXSw8bLFu0OBZopnyhuTBveK+DgENsaz08weq0FElvCCkYbG/ufkqjBR7eRN5CkegIu
         VmHZ7C/YzfaIBt8YQYA5oHPSTTwaoXTDQzejbKRSCRT3m0mCZI5CjNBPNA4j84zbuyKc
         BdwEvfwF4/3U/2YuTKCXnGm/MH6DbyTe7A5O1269qRRDjvg39F614WtcAIyTJMw7w1Dl
         8HIlnFwLXNeSAp9HORxWA317itrP+LGzPhRRC0hVrxeF1BgZKbZ+ItX97v0QJqDUVg1d
         hpVg==
X-Gm-Message-State: ABy/qLZiurKE1maMk1dfWO6CCgt+tcebYGXIJrq4YflDggFWtfaep9m4
        zM0Y9nx0IfKCzz2+OAxaM6zPiQ==
X-Google-Smtp-Source: APBJJlEtFk/8Lz8CIklvF9OECplOfi/k4QZDPUg0bwjBJNy9a91uTEArW6J8gD6xhoTP3eyeLZ4DdQ==
X-Received: by 2002:a7b:cbd4:0:b0:3fe:1232:93fa with SMTP id n20-20020a7bcbd4000000b003fe123293famr8362954wmi.22.1691080850823;
        Thu, 03 Aug 2023 09:40:50 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id c7-20020a7bc847000000b003fe22da3bc5sm4626929wml.42.2023.08.03.09.40.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Aug 2023 09:40:50 -0700 (PDT)
From:   Yoann Congal <yoann.congal@smile.fr>
To:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kbuild@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, Yoann Congal <yoann.congal@smile.fr>
Subject: [PATCH] kconfig: avoid an infinite loop in oldconfig/syncconfig
Date:   Thu,  3 Aug 2023 18:40:22 +0200
Message-Id: <20230803164022.2232051-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Exit on error when asking for value that has an invalid default value
and stdin is closed. Previously, this case would loop.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 scripts/kconfig/conf.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/scripts/kconfig/conf.c b/scripts/kconfig/conf.c
index 33d19e419908b..38ff9c81e071d 100644
--- a/scripts/kconfig/conf.c
+++ b/scripts/kconfig/conf.c
@@ -376,6 +376,15 @@ static int conf_string(struct menu *menu)
 		}
 		if (def && sym_set_string_value(sym, def))
 			return 0;
+		else {
+			if (feof(stdin) && !sym_string_valid(sym, sym_get_string_value(sym))) {
+				fprintf(stderr,
+						"Symbol %s has invalid default value and stdin reached EOF\n",
+						sym->name);
+				exit(1);
+			}
+		}
+
 	}
 }
 
-- 
2.30.2

