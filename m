Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0C13996D77
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 Aug 2019 01:22:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726986AbfHTXVl (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 20 Aug 2019 19:21:41 -0400
Received: from mail-vs1-f74.google.com ([209.85.217.74]:53098 "EHLO
        mail-vs1-f74.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726980AbfHTXVk (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 20 Aug 2019 19:21:40 -0400
Received: by mail-vs1-f74.google.com with SMTP id w2so142599vso.19
        for <linux-kbuild@vger.kernel.org>; Tue, 20 Aug 2019 16:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=T94Ldr45BAcQvYAvJ8Y+rDntZ4kBO4X+NPr7Ifz4Qao=;
        b=EFyVTG07Exi4UaiWRBWcrqjeK3OigGHFopAe2CffL0d9XPm3H7ECo7PJmaYrh2vVMN
         Ied1Uh53sjFh8MiXULxEEWKt522KBiD8/qCyc8ionMtskrEQY7AqJbtuXdeIRpVfR6J3
         NUsaVEI1vhxCxPBbmusd2UlYmQ0HRh0pDPbSdlJ0EkPvwPHcRfFofWtl5psF+Ikb+C9K
         292A+bKTq6YKyswmWOE/7TWI00ErLohvyzIi69m+MDfqGzeQzw5X8+B6e2SdUL9F/KwC
         jTNNYJlhHSc41CLuQBbGC/bYqdnIwGNTR8qH7sFYld8Yd4Ekrs8JKToVb0VvbYD8qhpQ
         o+bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=T94Ldr45BAcQvYAvJ8Y+rDntZ4kBO4X+NPr7Ifz4Qao=;
        b=KwhQpag3EjCzgHzye9zlgpaf7CKYQMLy6/r/XBGcMQqH9wlMyDUbq1EkQ8MReTmL+g
         9OZr5F21aL7+R6Moi/VU3p99tWDATZyF+EnVHqV2bLjp651Nul5LuGH7Gu+1vHWLv3YY
         7XaimN3pErSHpN99Ur542UCajjPxk4dY5V5NKJ9LxBdIogBunxRBhAvbJqm1Cr6KnGKX
         A+9uyhIA/N5U5CwPsK2ADOOzmRRR50wQ0XDkp4fminwLJi5poE0UQmWt77qCdhHPatLk
         t5JinfhkiBSlHubOQGuvBgyufSZinsp1d9tg51egMptyONNzYdtGmeQY+DV3QHbuCHKC
         qowg==
X-Gm-Message-State: APjAAAXWIiEy8CAXr57aUtj3xm+IMRK1wWNMQu0er5hKtHksTJ00gHZx
        VuHnPgQ6zevkFWkJ994y6i9r604ofRQndqdw433ceA==
X-Google-Smtp-Source: APXvYqxh2r8/Dyslnkrm5yAR1V7pXj5oYYDJiDInjvKNVIOiEnzifza+DlpH9bEyO+XPLxxYg+bgGDgljzWHWJgD5OjvrA==
X-Received: by 2002:ab0:5ad1:: with SMTP id x17mr748825uae.52.1566343298916;
 Tue, 20 Aug 2019 16:21:38 -0700 (PDT)
Date:   Tue, 20 Aug 2019 16:20:44 -0700
In-Reply-To: <20190820232046.50175-1-brendanhiggins@google.com>
Message-Id: <20190820232046.50175-17-brendanhiggins@google.com>
Mime-Version: 1.0
References: <20190820232046.50175-1-brendanhiggins@google.com>
X-Mailer: git-send-email 2.23.0.rc1.153.gdeed80330f-goog
Subject: [PATCH v14 16/18] MAINTAINERS: add entry for KUnit the unit testing framework
From:   Brendan Higgins <brendanhiggins@google.com>
To:     frowand.list@gmail.com, gregkh@linuxfoundation.org,
        jpoimboe@redhat.com, keescook@google.com,
        kieran.bingham@ideasonboard.com, mcgrof@kernel.org,
        peterz@infradead.org, robh@kernel.org, sboyd@kernel.org,
        shuah@kernel.org, tytso@mit.edu, yamada.masahiro@socionext.com
Cc:     devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        kunit-dev@googlegroups.com, linux-doc@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-nvdimm@lists.01.org, linux-um@lists.infradead.org,
        Alexander.Levin@microsoft.com, Tim.Bird@sony.com,
        amir73il@gmail.com, dan.carpenter@oracle.com, daniel@ffwll.ch,
        jdike@addtoit.com, joel@jms.id.au, julia.lawall@lip6.fr,
        khilman@baylibre.com, knut.omang@oracle.com, logang@deltatee.com,
        mpe@ellerman.id.au, pmladek@suse.com, rdunlap@infradead.org,
        richard@nod.at, rientjes@google.com, rostedt@goodmis.org,
        wfg@linux.intel.com, Brendan Higgins <brendanhiggins@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Add myself as maintainer of KUnit, the Linux kernel's unit testing
framework.

Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Logan Gunthorpe <logang@deltatee.com>
Reviewed-by: Stephen Boyd <sboyd@kernel.org>
---
 MAINTAINERS | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index a2c343ee3b2ca..f0bd77e8a8a2f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8799,6 +8799,17 @@ S:	Maintained
 F:	tools/testing/selftests/
 F:	Documentation/dev-tools/kselftest*
 
+KERNEL UNIT TESTING FRAMEWORK (KUnit)
+M:	Brendan Higgins <brendanhiggins@google.com>
+L:	linux-kselftest@vger.kernel.org
+L:	kunit-dev@googlegroups.com
+W:	https://google.github.io/kunit-docs/third_party/kernel/docs/
+S:	Maintained
+F:	Documentation/dev-tools/kunit/
+F:	include/kunit/
+F:	kunit/
+F:	tools/testing/kunit/
+
 KERNEL USERMODE HELPER
 M:	Luis Chamberlain <mcgrof@kernel.org>
 L:	linux-kernel@vger.kernel.org
-- 
2.23.0.rc1.153.gdeed80330f-goog

