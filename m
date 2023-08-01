Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CD8B776BBAB
	for <lists+linux-kbuild@lfdr.de>; Tue,  1 Aug 2023 19:50:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232246AbjHARuj (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 1 Aug 2023 13:50:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231593AbjHARuc (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 1 Aug 2023 13:50:32 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D3CA1BF6
        for <linux-kbuild@vger.kernel.org>; Tue,  1 Aug 2023 10:49:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1690912177;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=WCyW2xPGvGn2KArLxMejeAbnztOOe9Ja2AC5dTRufnw=;
        b=JOaHBXQzLcTmSgvViOjkVIQxhBcpmV72JAu7W3TiUH1+AJwFPscUXiwN9jBS+6w4MqtSjB
        uuPKwGA7bg1KGpE8/8mcMjDopCYSxY2Ta2kklPXGfalofimtTj2viYd/AGqqoRv3ozgm0M
        Yi+396ugqlnRtTerYtaRA9qkZz4x2L8=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-93-mzBcYWxjPWixzUp5mO_ujg-1; Tue, 01 Aug 2023 13:49:36 -0400
X-MC-Unique: mzBcYWxjPWixzUp5mO_ujg-1
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-583da2ac09fso70049927b3.1
        for <linux-kbuild@vger.kernel.org>; Tue, 01 Aug 2023 10:49:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690912175; x=1691516975;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WCyW2xPGvGn2KArLxMejeAbnztOOe9Ja2AC5dTRufnw=;
        b=KBWi1u4DOvcXQxrAVIZCUHGAyDDLFkylzpTTBlg3F6gMqHXnXIhkVoUPwQoqnY83+S
         3cSr1FxVF/L7bP846NyhQrQZ1q+coj9qPFqpGV2t8YhiOnJ7rhhrZs2OVnItYmW1YV01
         aufRrrDPuxV4btCmnNANRJTW897MAx8hFBg6I08+xrDgHldRKDsQ/3IyZioCjgLnn+Y5
         9BluCYSQNmskJv4Cqs+AvuOAQ7kWSt+sEO++ik+3DNImqUHB9D8el+WoF4TE6sfumguc
         xf8EbLDTZMbBSNDDGMvhw1TDJ9veWHTaeSLaqYSpAF115ZMZNpv5JOchfHB9hczJeVAf
         mEbQ==
X-Gm-Message-State: ABy/qLYV74F37/a2q7l4vR/UHMt1UD10Nmpigr4ac+MnI7HWNUSE2eXj
        QP7uqC3V0O0vVFFJ0Ri6E8QZmC/2MToyH7Ohg56oqENp6ZuH5KVBqY7HXPDMjuEuCWe1cSHyCSg
        DaJZam4w5cZnvqHM6CBVdLTczCgeZnTpz
X-Received: by 2002:a81:7545:0:b0:56d:2189:d87a with SMTP id q66-20020a817545000000b0056d2189d87amr10919471ywc.15.1690912175524;
        Tue, 01 Aug 2023 10:49:35 -0700 (PDT)
X-Google-Smtp-Source: APBJJlE8Hw8Au5SbYBh3YUWTcg3E0mgPPknqhWJLpoxWy4nSR/rPLCcPgcfXi6Si9PBB/67pWc1+jA==
X-Received: by 2002:a81:7545:0:b0:56d:2189:d87a with SMTP id q66-20020a817545000000b0056d2189d87amr10919458ywc.15.1690912175223;
        Tue, 01 Aug 2023 10:49:35 -0700 (PDT)
Received: from brian-x1.. ([2600:381:222b:e67:295d:9324:c84:3382])
        by smtp.gmail.com with ESMTPSA id k187-20020a0dc8c4000000b005773afca47bsm3881728ywd.27.2023.08.01.10.49.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Aug 2023 10:49:34 -0700 (PDT)
From:   Brian Masney <bmasney@redhat.com>
To:     masahiroy@kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Subject: [PATCH 0/2] scripts: add two new scripts to look up Kconfigs
Date:   Tue,  1 Aug 2023 13:49:20 -0400
Message-ID: <20230801174922.333700-1-bmasney@redhat.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Here's two new scripts that I think that other people will find useful.
One is to look up a Kconfig name based on the module path and the second
script looks up the full Kconfig information based on the symbol name.

Brian Masney (2):
  scripts: add mod-to-kconfig.sh
  scripts: add kconfig lookup script

 scripts/kconfig/lookup.sh         | 77 +++++++++++++++++++++++++
 scripts/kconfig/mod-to-kconfig.sh | 93 +++++++++++++++++++++++++++++++
 2 files changed, 170 insertions(+)
 create mode 100755 scripts/kconfig/lookup.sh
 create mode 100755 scripts/kconfig/mod-to-kconfig.sh

-- 
2.41.0

