Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AED2375871
	for <lists+linux-kbuild@lfdr.de>; Thu, 25 Jul 2019 21:56:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726207AbfGYT4j (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 25 Jul 2019 15:56:39 -0400
Received: from mail-wr1-f47.google.com ([209.85.221.47]:38835 "EHLO
        mail-wr1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726126AbfGYT4i (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 25 Jul 2019 15:56:38 -0400
Received: by mail-wr1-f47.google.com with SMTP id g17so52026723wrr.5;
        Thu, 25 Jul 2019 12:56:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=FCMWQXps57iJ9hRjIRfg44PssDq4iyaMxzlx0pazmN4=;
        b=QY9Y1Ck908tpG9DhsRzPGxdMho0MuCdmqfty7Kr8P9jA2ugJ70ErXff28QerNIp7vK
         HXw/LJ4JYsXdzpDr0XkC8wCZ4B6DYKvit8pMXG2nqH9NiBUTBGL4prGq/NGUd5gOiiMh
         FAJ45yPupn0jVL3mHLMznxOEDcOyhRiJajAQ03UFyQ1aYmsb1mTANrVRk2bJWbP5WiRj
         y2IXP8Lkp0CMZlQYHxpHu01aKUuGntPUxd8GiYbMbr07zE58Ior8G+EVa8nSRgWIIcHm
         z7hVPcbWdB++qeFIRnCkCLhTB7KGL5a0OFCdnVcehwEBKtIxrKHyiD2piFPUHf9kfZ24
         LTyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=FCMWQXps57iJ9hRjIRfg44PssDq4iyaMxzlx0pazmN4=;
        b=pPD1MGYIme1BHUSPczDAAWLTcLPbxWATDwwhYufNEat5adcPXt+PYPH+bmJ22AsQh6
         A58a+k/AN3+FKkc0PFzbd1Yl5kkeKWltBOsg1woJvU78rQiSsVNPZ4rSjqoeawSi4uHn
         SxraQe/frCxytjunbyv9JkHv1AFvpRZVeFx43INC+IYmdwOHXduwHGjKjtgVhrt68qdK
         +Bg3CGvfj2ah84jbv6p+G6BXVeWmMta5rPbi+dCsEMYo+63A0gHVCjdWNkuqi+1ialg+
         j5wgC4eVWDJTtS/BH9wLmO6IIz0w/SOPMoCwed2ytsJhIo1JKqcXAIkOgdHbL2g0bDxk
         60Uw==
X-Gm-Message-State: APjAAAUfCNpmXnXftbaAd+EtCAyZK4kMyuBmeAj7oZ/mHc2wKwawcgfD
        bfSh5h8ju9V9Rq2Pdoy4QzBHhVI=
X-Google-Smtp-Source: APXvYqw2hxOXNQbNANt+fBNUe9CAESS1rA4VG/7mmizYy6r2daz2/LqONbGGc0TfUlnxulJ+RItX6w==
X-Received: by 2002:adf:dd01:: with SMTP id a1mr7273514wrm.12.1564084596367;
        Thu, 25 Jul 2019 12:56:36 -0700 (PDT)
Received: from avx2 ([46.53.248.55])
        by smtp.gmail.com with ESMTPSA id f7sm50225925wrv.38.2019.07.25.12.56.35
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 25 Jul 2019 12:56:35 -0700 (PDT)
Date:   Thu, 25 Jul 2019 22:56:33 +0300
From:   Alexey Dobriyan <adobriyan@gmail.com>
To:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: .h.s files spam
Message-ID: <20190725195633.GA15202@avx2>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

What are these files for?

	$ cat ../obj/include/linux/kernel.h.s
        .file   "null"
        .text
        .ident  "GCC: (Gentoo 9.1.0-r1 p1.1) 9.1.0"
        .section        .note.GNU-stack,"",@progbits

	$ find ../obj/ -type f -name '*.s' | wc -l
	4047

It is "allyesconfig" in case someone is going to reproduce it.
