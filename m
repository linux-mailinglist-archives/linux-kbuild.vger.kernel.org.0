Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 255D2454529
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Nov 2021 11:46:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236519AbhKQKs6 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 17 Nov 2021 05:48:58 -0500
Received: from mail-lf1-f43.google.com ([209.85.167.43]:44872 "EHLO
        mail-lf1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231777AbhKQKs5 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 17 Nov 2021 05:48:57 -0500
Received: by mail-lf1-f43.google.com with SMTP id y26so6113406lfa.11;
        Wed, 17 Nov 2021 02:45:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QTiDoGA76puJ8yYVWohueCxv2yQdFsswHJPx2rPbTXw=;
        b=khjmMgN2W5nU6PmxD95JH8W8/XQXpdpDQkIzZ35/yPpNtcoUfY63gHBF2kjo629Yf9
         ZXVXb4qt/A1tZlm4DYQ30VI+XM89TgPUE2wGMmV0YWYf8UrSBd4pKYB2Hp641V2ghGV6
         2X0gOY5UL6yhQ2/vIHyEsOQUvfI0NWnN/TSPiDooR+c74HhwIrOhMcY7YoXW8nYegv3X
         mo2Uv4b0pVGufpDMKOlvOS2y1eVq6vyKKd5cc7aRmlAXH4HdikIOIBC8yeak1u9fQSt8
         MSuuyRuxqkP4Oiyg4XXSQxrK0BTNRW9pHVv4PqewWDc6hKSi9JkwAP4pgNa/iGTj6HxW
         zFSQ==
X-Gm-Message-State: AOAM532tlc5ZrUCeR8yzDSGsXsMnM4S5v+BCmmdarLI88NYNLcOPCt4b
        J+pVwyEr1sMC2fb9EvP6aTyIeIsxugo=
X-Google-Smtp-Source: ABdhPJwfQYz0YjUdOOl6rMiTdMbq5B161cMwiiA36EWoEutPzlVDGmi8SGnawkXU70IJakyfTW/35A==
X-Received: by 2002:a05:6512:33d4:: with SMTP id d20mr14107144lfg.664.1637145958420;
        Wed, 17 Nov 2021 02:45:58 -0800 (PST)
Received: from kladdkakan.. ([185.213.154.234])
        by smtp.gmail.com with ESMTPSA id a12sm1431141lfk.227.2021.11.17.02.45.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Nov 2021 02:45:57 -0800 (PST)
From:   =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>
To:     josh@joshtriplett.org
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        masahiroy@kernel.org,
        =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>
Subject: [PATCH] kconfig: Add `make mod2noconfig` to disable module options
Date:   Wed, 17 Nov 2021 11:45:53 +0100
Message-Id: <20211117104553.765556-1-bjorn@kernel.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <37c3a9d3d6fceba0f55d05e7558370e3f60b8bf0.1634492509.git.josh@joshtriplett.org>
References: <37c3a9d3d6fceba0f55d05e7558370e3f60b8bf0.1634492509.git.josh@joshtriplett.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Josh Triplett wrote:
> When converting a modular kernel to a monolithic kernel, once the kernel
> works without loading any modules, this helps to quickly disable all the
> modules before turning off module support entirely.
> 
> Refactor conf_rewrite_mod_or_yes to a more general
> conf_rewrite_tristates that accepts an old and new state.
> 
> Signed-off-by: Josh Triplett <josh@joshtriplett.org>

Hmm, I don't think this was picked up yet?

FWIW,

Tested-by: Björn Töpel <bjorn@kernel.org>
