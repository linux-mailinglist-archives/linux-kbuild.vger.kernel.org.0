Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38090267FA4
	for <lists+linux-kbuild@lfdr.de>; Sun, 13 Sep 2020 15:21:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725950AbgIMNVo (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 13 Sep 2020 09:21:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34217 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725940AbgIMNVm (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 13 Sep 2020 09:21:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1600003300;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=OOpFezetXI8IrrJSgLq7um+2koSqBSrOyBGfrptdubM=;
        b=TisuCYK25vV7UwnRxpIeoCk6LfoBOtEsvu45FvboQrnTxN6NNE9F78+Knewg4YD6OHOLN4
        JaTvcAvZZ6cXOTPOWL32O0wOdA/Dltzy9bQTa61wRL47YkjVMYVQ2D/5L29o7cENF0hgcr
        xR/H4fjCWFHJjFR1qnG7vO4Zh+wV9Mo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-271-uYiXA8wFPvKx7CGNoN5Csw-1; Sun, 13 Sep 2020 09:21:37 -0400
X-MC-Unique: uYiXA8wFPvKx7CGNoN5Csw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D0D4A1DDF7;
        Sun, 13 Sep 2020 13:21:35 +0000 (UTC)
Received: from starship (unknown [10.35.206.72])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 80A627839F;
        Sun, 13 Sep 2020 13:21:34 +0000 (UTC)
Message-ID: <e04f1e9372f896d435d972cc6b70d1eb3b0c32a2.camel@redhat.com>
Subject: xconfig is broken again on Qt5
From:   Maxim Levitsky <mlevitsk@redhat.com>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-kernel@vger.kernel.org
Date:   Sun, 13 Sep 2020 16:21:33 +0300
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.3 (3.36.3-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

I hate to say it, but xconfig got broken again.

After commit 68fd110b3e7e2 ("kconfig: qconf: remove redundant help in the info view")
help description disappered completely from xconfig (both normal and split mode)

I reverted this and next commit to get this back.

I have a feeling that there were several bugs introduced to xconfig recently
due to attempt to support both Qt4 and Qt5. Maybe we should only support one version?

I tried gconfig even thinking maybe nobody uses xconfig these days
but gconfig seems to lack search function.

Best regards,
	Maxim Levitsky

