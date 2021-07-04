Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECC2E3BAF3B
	for <lists+linux-kbuild@lfdr.de>; Sun,  4 Jul 2021 23:34:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229998AbhGDVgr (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 4 Jul 2021 17:36:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229814AbhGDVgr (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 4 Jul 2021 17:36:47 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74A9CC061574;
        Sun,  4 Jul 2021 14:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=NSFtDVcn1UZ5fHBw/wxs+K3bbxug+yk5lDy1UuFsjwI=; b=RfWCwnqm+aJY6sOMjzxwF735cg
        4znkt9Ml72y6/G7e7iEtYhSGs4yIcigKPaZCiNV3h0uIrbaMV+yCfzyRuJ2R+B+UwQ6n4TZSNHXu2
        Fpk8shYMvC/Okhl2xlbFBD7PjuXhXPegv2z2UxrE68M+kZXsXDLuPBjIgAeo52oYTQtCZWyFQCQF2
        B0P6kICqA4ccWoo5Ggb42bKZssi005FTr7wVhGuMjZH+XsxBfa5PY8wXOqeJ7jP5I5UcaqdsZ7Zgs
        H6kvRUbSsCYmTx4Kqu1G7WV2mD3UgXhDfabTlMptjtgST8Etz2W7qnaTO7OVZ4t4qaFaINs9n2XYi
        0pi5foSg==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
        id 1m09kB-009byv-Ax; Sun, 04 Jul 2021 21:33:44 +0000
Date:   Sun, 4 Jul 2021 22:33:39 +0100
From:   Matthew Wilcox <willy@infradead.org>
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc:     Miguel Ojeda <ojeda@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux <rust-for-linux@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Geoffrey Thomas <geofft@ldpreload.com>,
        Finn Behrens <me@kloenk.de>,
        Adam Bratschi-Kaye <ark.email@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>
Subject: Re: [PATCH 01/17] kallsyms: support big kernel symbols (2-byte
 lengths)
Message-ID: <YOIpM3iFT5roz69i@casper.infradead.org>
References: <20210704202756.29107-1-ojeda@kernel.org>
 <20210704202756.29107-2-ojeda@kernel.org>
 <YOIicc94zvSjrKfe@casper.infradead.org>
 <CANiq72=eHs870jbmZz8CUEUuN2NOCaKS9-F6-jAb0QXje2x1Eg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiq72=eHs870jbmZz8CUEUuN2NOCaKS9-F6-jAb0QXje2x1Eg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, Jul 04, 2021 at 11:17:50PM +0200, Miguel Ojeda wrote:
> On Sun, Jul 4, 2021 at 11:05 PM Matthew Wilcox <willy@infradead.org> wrote:
> >
> > What happened to my suggestion from last time of encoding symbols < 128
> > as 0-127 and symbols larger than that as (data[0] - 128) * 256 +
> > data[1]) ?
> 
> Nothing, sorry, we focused on other parts (e.g. the allocation panics)
> during this iteration. I can take a look for v2.

Here's what I have.  Build testing now.


diff --git a/kernel/kallsyms.c b/kernel/kallsyms.c
index c851ca0ed357..0d45a6e5fdc3 100644
--- a/kernel/kallsyms.c
+++ b/kernel/kallsyms.c
@@ -67,6 +67,14 @@ static unsigned int kallsyms_expand_symbol(unsigned int off,
 	len = *data;
 	data++;
 
+	/* lengths larger than 128 are encoded as two bytes */
+	if (len >= 128) {
+		len -= 128;
+		len *= 256;
+		len += *data;
+		data++;
+	}
+
 	/*
 	 * Update the offset to return the offset for the next symbol on
 	 * the compressed stream.
diff --git a/scripts/kallsyms.c b/scripts/kallsyms.c
index 54ad86d13784..701566e01a1d 100644
--- a/scripts/kallsyms.c
+++ b/scripts/kallsyms.c
@@ -467,10 +467,16 @@ static void write_src(void)
 	output_label("kallsyms_names");
 	off = 0;
 	for (i = 0; i < table_cnt; i++) {
+		int len = table[i]->len;
 		if ((i & 0xFF) == 0)
 			markers[i >> 8] = off;
 
-		printf("\t.byte 0x%02x", table[i]->len);
+		if (len >= 128) {
+			printf("\t.byte 0x%02x\n", len / 256 + 128);
+			len %= 256;
+			off++;
+		}
+		printf("\t.byte 0x%02x", len);
 		for (k = 0; k < table[i]->len; k++)
 			printf(", 0x%02x", table[i]->sym[k]);
 		printf("\n");
