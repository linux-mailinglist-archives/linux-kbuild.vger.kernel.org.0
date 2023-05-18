Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0C8B1707AA8
	for <lists+linux-kbuild@lfdr.de>; Thu, 18 May 2023 09:13:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229780AbjERHNb (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 18 May 2023 03:13:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229749AbjERHNa (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 18 May 2023 03:13:30 -0400
X-Greylist: delayed 456 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 18 May 2023 00:13:28 PDT
Received: from cstnet.cn (smtp86.cstnet.cn [159.226.251.86])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 24C13185
        for <linux-kbuild@vger.kernel.org>; Thu, 18 May 2023 00:13:27 -0700 (PDT)
Received: from sunying$nj.iscas.ac.cn ( [180.111.102.183] ) by
 ajax-webmail-APP-16 (Coremail) ; Thu, 18 May 2023 15:05:49 +0800
 (GMT+08:00)
X-Originating-IP: [180.111.102.183]
Date:   Thu, 18 May 2023 15:05:49 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From:   sunying@nj.iscas.ac.cn
To:     masahiroy@kernel.org, linux-kbuild@vger.kernel.org
Subject: Suggestion: Improve the dependency information during Kconfig
 compilation
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.15 build 20230321(1bf45b10)
 Copyright (c) 2002-2023 www.mailtech.cn cnic.cn
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <729c71ad.51ce3.1882daddff7.Coremail.sunying@nj.iscas.ac.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: sQCowAAH6qZNzmVkkS0ZAA--.38760W
X-CM-SenderInfo: 5vxq5xdqj60y4olvutnvoduhdfq/1tbiCQcPAWRlyqgP+QAAsV
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
        CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
        daVFxhVjvjDU=
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

SGksCgoKV2UgZm91bmQgdGhhdCB0aGUgS2NvbmZpZyBidWlsZCBzeXN0ZW0gc2lsZW50bHkgY2hh
bmdlcyBpbnZhbGlkIHZhbHVlcyBpbiB0aGUuIGNvbmZpZyBmaWxlLAp3aGljaCBtYXkgcHJldmVu
dCB1c2VycyBmcm9tIGdldHRpbmcgdGhlaXIgZGVzaXJlZCBrZXJuZWwsIGFuZCBhbHNvIG1ha2Ug
aXQgaGFyZCB0byBrbm93CndoaWNoIGNvbmZpZ3VyYXRpb24gb3B0aW9uIGNhdXNlZCB0aGUgZm9y
Y2VkIGNoYW5nZSBiYXNlZCBvbiB0aGUgY29tcGlsYXRpb24gaW5mb3JtYXRpb24uCgpUaGVyZSBh
cmUgc2ltaWxhciBxdWVzdGlvbnMgb24gc3RhY2sgb3ZlcmZsb3csIHdoZXJlIHBlb3BsZSBmaW5k
IGl0IGRpZmZpY3VsdCB0byBnZXQgCnRoZSBjb21wbGV0ZSBkZXBlbmRlbmN5IGNoYWluIGFuZCBv
dGhlciBpbmZvcm1hdGlvbu+8mgoKICBleDEuIEhvdyBjYW4gSSBkaXNhYmxlIENPTkZJR19QTSB3
aGVuIGJ1aWxkaW5nIExpbnV4IGtlcm5lbCBmb3IgeDg2XzY0IC0gU3RhY2sgT3ZlcmZsb3cKICBo
dHRwczovL3N0YWNrb3ZlcmZsb3cuY29tL3F1ZXN0aW9ucy82NDQ5OTIyMS9ob3ctY2FuLWktZGlz
YWJsZS1jb25maWctcG0td2hlbi1idWlsZGluZy1saW51eC1rZXJuZWwtZm9yLXg4Ni02NC82NDUw
MTY0NyM2NDUwMTY0NwoKICBleDIuIGMgLSBrZXJuZWwgc3ltYm9sIGVuYWJsZWQgYnV0IGRvZXNu
J3Qgc2hvd3MgdXAgaW4gLmNvbmZpZyAtIFN0YWNrIE92ZXJmbG93CiAgaHR0cHM6Ly9zdGFja292
ZXJmbG93LmNvbS9xdWVzdGlvbnMvMjQwNzQxMTYva2VybmVsLXN5bWJvbC1lbmFibGVkLWJ1dC1k
b2VzbnQtc2hvd3MtdXAtaW4tY29uZmlnKQoKICBleDMuIG1ha2VmaWxlIC0gdXBkYXRlIG1lbnVj
b25maWcgZW50cmllcyB3aXRob3V0IHJlY29tcGlsaW5nIGFsbCB0aGUga2VybmVsIC0gU3RhY2sg
T3ZlcmZsb3cKICBodHRwczovL3N0YWNrb3ZlcmZsb3cuY29tL3F1ZXN0aW9ucy83MTA3NTExMy91
cGRhdGUtbWVudWNvbmZpZy1lbnRyaWVzLXdpdGhvdXQtcmVjb21waWxpbmctYWxsLXRoZS1rZXJu
ZWwKCiAgZXg0LiBsaW51eCAtIGRpc2FibGluZyBDT05GSUdfTkVUX0RNQSAtIFN0YWNrIE92ZXJm
bG93CiAgaHR0cHM6Ly9zdGFja292ZXJmbG93LmNvbS9xdWVzdGlvbnMvMzA3OTQ1NzYvZGlzYWJs
aW5nLWNvbmZpZy1uZXQtZG1hLzMwNzk2ODIwIzMwNzk2ODIwCgpXZSBwbGFuIHRvIG9wdGltaXpl
IHRoZSBjb25mX3JlYWQoKSBmdW5jdGlvbiBpbiAvc2NyaXB0cy9rY29uZmlnL2NvbmZkYXRhLmMs
IAphbmQgYWRkIGluZm9ybWF0aW9uIGZvciB0aGUgbWlzbWF0Y2hlZCBjb25maWd1cmF0aW9uIG9w
dGlvbnMgdG8gaGVscCB1c2VycyBnZXQgdGhlIGRlc2lyZWQgTGludXgga2VybmVsLgpEbyB5b3Ug
dGhpbmsgaXQncyBuZWNlc3Nhcnk/IEFueSBzdWdnZXN0aW9ucz8KCgpCZXN0IHJlZ2FyZHMsClNp
eXVhbiBHdW8KWWluZyBTdW4KCgo=
