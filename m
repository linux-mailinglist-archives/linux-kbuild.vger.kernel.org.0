Return-Path: <linux-kbuild+bounces-11105-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EJ5ICdKdi2k3XAAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11105-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Feb 2026 22:06:26 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E1E711F418
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Feb 2026 22:06:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6766230AE6B9
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Feb 2026 20:55:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D7F9339853;
	Tue, 10 Feb 2026 20:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tngtech.com header.i=@tngtech.com header.b="SINr3kYq"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mailgw01.zimbra-vnc.de (mailgw01.zimbra-vnc.de [148.251.101.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A70E3332EB2;
	Tue, 10 Feb 2026 20:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.101.236
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770756918; cv=none; b=AdQc2BqAuolPwrMgontvrvH+X7EbGrJ/gFwAktParSIn8MjOOFnjGmw9NKOLis6R7xvrrQfgtZJvjtg02+b+ESXHorveh/qqdEKYs0jGHwZBi1cBIACIoTqUVw5l9qnPFXT/8+yAEEqM8ByYMgt0CnRRgu/n2wSkLUo2GQt7bKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770756918; c=relaxed/simple;
	bh=qQt/0pFIMZ4ID7Ei7oM362HUG7pJeQNgBPPCJk/4Vmg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=K7OREgIgnwEjhL7l5MtskGvTVOd4Vcw/O/5/stwjzFGhi5csGQphkUYTU5z5oKh2+PBWUQBBeQ2BfUx/eOB/VUKtJZ08/DKB3DIaQTgdvY+ZW/2t/o0skls3RCG8xFhwQxTJrjpmTE7VHTzdLv9WsI7a52UWEmifrxiXZxv6OK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tngtech.com; spf=pass smtp.mailfrom=tngtech.com; dkim=pass (2048-bit key) header.d=tngtech.com header.i=@tngtech.com header.b=SINr3kYq; arc=none smtp.client-ip=148.251.101.236
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tngtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tngtech.com
Received: from zmproxy.tng.vnc.biz (zimbra-vnc.tngtech.com [35.234.71.156])
	by mailgw01.zimbra-vnc.de (Postfix) with ESMTPS id 308293FAF0;
	Tue, 10 Feb 2026 21:55:15 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTP id 135221FA999;
	Tue, 10 Feb 2026 21:55:15 +0100 (CET)
Received: from zmproxy.tng.vnc.biz ([127.0.0.1])
 by localhost (zmproxy.tng.vnc.biz [127.0.0.1]) (amavis, port 10032)
 with ESMTP id 4bJTjLgYb-JZ; Tue, 10 Feb 2026 21:55:14 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTP id 08AF51FA944;
	Tue, 10 Feb 2026 21:55:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 zmproxy.tng.vnc.biz 08AF51FA944
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tngtech.com;
	s=B14491C6-869D-11EB-BB6C-8DD33D883B31; t=1770756914;
	bh=fBO0PyIDQ7cepqLTUvORiwCyUPaXLJRqBvZ17pqQ+kQ=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=SINr3kYq4yrWjR1pzz8P6GqadNbC89WuOLJRqkhSDONEFGbvHQSKGu0yMnJiF3P+a
	 M5GNvDuPa/CPFgGql5KWO3nX5DRxN77iurDyDto375ZmcmDzMCndoWilRNpFt/oW2J
	 EOazk83h1/Pm0yD4JQZP3tQmpMsEG/oGqWRM/WtzB8spz97qUrrpS+rgnXsQzj4tuJ
	 /mC2S4uTq10ipqNLgzE/8OHmJdEi0QcLe/8BlN1hss2HnCyl14UIZj/wL55JzXnVWA
	 dv9DLarQbcIKNNrtI7RO5uRsEZgjmMQW/h8sOHm3POjLb1wfYbgYNwllHwpUxONIvU
	 ULIwSFzq9cNJQ==
X-Virus-Scanned: amavis at zmproxy.tng.vnc.biz
Received: from zmproxy.tng.vnc.biz ([127.0.0.1])
 by localhost (zmproxy.tng.vnc.biz [127.0.0.1]) (amavis, port 10026)
 with ESMTP id A2x86Br7lJjM; Tue, 10 Feb 2026 21:55:13 +0100 (CET)
Received: from DESKTOP-0O0JV6I.localdomain (ipservice-092-208-231-176.092.208.pools.vodafone-ip.de [92.208.231.176])
	by zmproxy.tng.vnc.biz (Postfix) with ESMTPSA id 9F0811FA999;
	Tue, 10 Feb 2026 21:55:13 +0100 (CET)
From: Luis Augenstein <luis.augenstein@tngtech.com>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org,
	gregkh@linuxfoundation.org,
	kstewart@linuxfoundation.org,
	maximilian.huber@tngtech.com,
	Luis Augenstein <luis.augenstein@tngtech.com>
Subject: [PATCH 07/15] scripts/sbom: add SPDX classes
Date: Tue, 10 Feb 2026 21:54:16 +0100
Message-Id: <20260210205424.11195-8-luis.augenstein@tngtech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260210205424.11195-1-luis.augenstein@tngtech.com>
References: <20260210205424.11195-1-luis.augenstein@tngtech.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [8.84 / 15.00];
	URIBL_BLACK(7.50)[spdx.github.io:url];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.15)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-11105-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_ALLOW(0.00)[tngtech.com:s=B14491C6-869D-11EB-BB6C-8DD33D883B31];
	FORGED_SENDER_MAILLIST(0.00)[];
	GREYLIST(0.00)[pass,body];
	DMARC_POLICY_ALLOW(0.00)[tngtech.com,quarantine];
	DKIM_TRACE(0.00)[tngtech.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	PRECEDENCE_BULK(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tngtech.com:mid,tngtech.com:dkim,tngtech.com:email,spdx.org:url,spdx.github.io:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FROM_NEQ_ENVFROM(0.00)[luis.augenstein@tngtech.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	R_SPF_ALLOW(0.00)[+ip6:2600:3c0a:e001:db::/64:c];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 6E1E711F418
X-Rspamd-Action: add header
X-Spam: Yes

Implement Python dataclasses to model the SPDX classes
required within an SPDX document. The class and property
names are consistent with the SPDX 3.0.1 specification.

Assisted-by: Claude Sonnet 4.5
Assisted-by: GLM-4.7
Co-developed-by: Maximilian Huber <maximilian.huber@tngtech.com>
Signed-off-by: Maximilian Huber <maximilian.huber@tngtech.com>
Signed-off-by: Luis Augenstein <luis.augenstein@tngtech.com>
---
 scripts/sbom/sbom/spdx/__init__.py        |   7 +
 scripts/sbom/sbom/spdx/build.py           |  17 ++
 scripts/sbom/sbom/spdx/core.py            | 182 ++++++++++++++++++++++
 scripts/sbom/sbom/spdx/serialization.py   |  56 +++++++
 scripts/sbom/sbom/spdx/simplelicensing.py |  20 +++
 scripts/sbom/sbom/spdx/software.py        |  71 +++++++++
 scripts/sbom/sbom/spdx/spdxId.py          |  36 +++++
 7 files changed, 389 insertions(+)
 create mode 100644 scripts/sbom/sbom/spdx/__init__.py
 create mode 100644 scripts/sbom/sbom/spdx/build.py
 create mode 100644 scripts/sbom/sbom/spdx/core.py
 create mode 100644 scripts/sbom/sbom/spdx/serialization.py
 create mode 100644 scripts/sbom/sbom/spdx/simplelicensing.py
 create mode 100644 scripts/sbom/sbom/spdx/software.py
 create mode 100644 scripts/sbom/sbom/spdx/spdxId.py

diff --git a/scripts/sbom/sbom/spdx/__init__.py b/scripts/sbom/sbom/spdx/=
__init__.py
new file mode 100644
index 000000000000..4097b59f8f17
--- /dev/null
+++ b/scripts/sbom/sbom/spdx/__init__.py
@@ -0,0 +1,7 @@
+# SPDX-License-Identifier: GPL-2.0-only OR MIT
+# Copyright (C) 2025 TNG Technology Consulting GmbH
+
+from .spdxId import SpdxId, SpdxIdGenerator
+from .serialization import JsonLdSpdxDocument
+
+__all__ =3D ["JsonLdSpdxDocument", "SpdxId", "SpdxIdGenerator"]
diff --git a/scripts/sbom/sbom/spdx/build.py b/scripts/sbom/sbom/spdx/bui=
ld.py
new file mode 100644
index 000000000000..180a8f1e8bd3
--- /dev/null
+++ b/scripts/sbom/sbom/spdx/build.py
@@ -0,0 +1,17 @@
+# SPDX-License-Identifier: GPL-2.0-only OR MIT
+# Copyright (C) 2025 TNG Technology Consulting GmbH
+
+from dataclasses import dataclass, field
+from sbom.spdx.core import DictionaryEntry, Element, Hash
+
+
+@dataclass(kw_only=3DTrue)
+class Build(Element):
+    """https://spdx.github.io/spdx-spec/v3.0.1/model/Build/Classes/Build=
/"""
+
+    type: str =3D field(init=3DFalse, default=3D"build_Build")
+    build_buildType: str
+    build_buildId: str
+    build_environment: list[DictionaryEntry] =3D field(default_factory=3D=
list[DictionaryEntry])
+    build_configSourceUri: list[str] =3D field(default_factory=3Dlist[st=
r])
+    build_configSourceDigest: list[Hash] =3D field(default_factory=3Dlis=
t[Hash])
diff --git a/scripts/sbom/sbom/spdx/core.py b/scripts/sbom/sbom/spdx/core=
.py
new file mode 100644
index 000000000000..c5de9194bb89
--- /dev/null
+++ b/scripts/sbom/sbom/spdx/core.py
@@ -0,0 +1,182 @@
+# SPDX-License-Identifier: GPL-2.0-only OR MIT
+# Copyright (C) 2025 TNG Technology Consulting GmbH
+
+from dataclasses import dataclass, field
+from datetime import datetime, timezone
+from typing import Any, Literal
+from sbom.spdx.spdxId import SpdxId
+
+SPDX_SPEC_VERSION =3D "3.0.1"
+
+ExternalIdentifierType =3D Literal["email", "gitoid", "urlScheme"]
+HashAlgorithm =3D Literal["sha256", "sha512"]
+ProfileIdentifierType =3D Literal["core", "software", "build", "lite", "=
simpleLicensing"]
+RelationshipType =3D Literal[
+    "contains",
+    "generates",
+    "hasDeclaredLicense",
+    "hasInput",
+    "hasOutput",
+    "ancestorOf",
+    "hasDistributionArtifact",
+    "dependsOn",
+]
+RelationshipCompleteness =3D Literal["complete", "incomplete", "noAssert=
ion"]
+
+
+@dataclass
+class SpdxObject:
+    def to_dict(self) -> dict[str, Any]:
+        def _to_dict(v: Any):
+            return v.to_dict() if hasattr(v, "to_dict") else v
+
+        d: dict[str, Any] =3D {}
+        for field_name in self.__dataclass_fields__:
+            value =3D getattr(self, field_name)
+            if not value:
+                continue
+
+            if isinstance(value, Element):
+                d[field_name] =3D value.spdxId
+            elif isinstance(value, list) and len(value) > 0 and isinstan=
ce(value[0], Element):  # type: ignore
+                value: list[Element] =3D value
+                d[field_name] =3D [v.spdxId for v in value]
+            else:
+                d[field_name] =3D [_to_dict(v) for v in value] if isinst=
ance(value, list) else _to_dict(value)  # type: ignore
+        return d
+
+
+@dataclass(kw_only=3DTrue)
+class IntegrityMethod(SpdxObject):
+    """https://spdx.github.io/spdx-spec/v3.0.1/model/Core/Classes/Integr=
ityMethod/"""
+
+
+@dataclass(kw_only=3DTrue)
+class Hash(IntegrityMethod):
+    """https://spdx.github.io/spdx-spec/v3.0.1/model/Core/Classes/Hash/"=
""
+
+    type: str =3D field(init=3DFalse, default=3D"Hash")
+    hashValue: str
+    algorithm: HashAlgorithm
+
+
+@dataclass(kw_only=3DTrue)
+class Element(SpdxObject):
+    """https://spdx.github.io/spdx-spec/v3.0.1/model/Core/Classes/Elemen=
t/"""
+
+    type: str =3D field(init=3DFalse, default=3D"Element")
+    spdxId: SpdxId
+    creationInfo: str =3D "_:creationinfo"
+    name: str | None =3D None
+    verifiedUsing: list[Hash] =3D field(default_factory=3Dlist[Hash])
+    comment: str | None =3D None
+
+
+@dataclass(kw_only=3DTrue)
+class ExternalMap(SpdxObject):
+    """https://spdx.github.io/spdx-spec/v3.0.1/model/Core/Classes/Extern=
alMap/"""
+
+    type: str =3D field(init=3DFalse, default=3D"ExternalMap")
+    externalSpdxId: SpdxId
+
+
+@dataclass(kw_only=3DTrue)
+class NamespaceMap(SpdxObject):
+    """https://spdx.github.io/spdx-spec/v3.0.1/model/Core/Classes/Namesp=
aceMap/"""
+
+    type: str =3D field(init=3DFalse, default=3D"NamespaceMap")
+    prefix: str
+    namespace: str
+
+
+@dataclass(kw_only=3DTrue)
+class ElementCollection(Element):
+    """https://spdx.github.io/spdx-spec/v3.0.1/model/Core/Classes/Elemen=
tCollection/"""
+
+    type: str =3D field(init=3DFalse, default=3D"ElementCollection")
+    element: list[Element] =3D field(default_factory=3Dlist[Element])
+    rootElement: list[Element] =3D field(default_factory=3Dlist[Element]=
)
+    profileConformance: list[ProfileIdentifierType] =3D field(default_fa=
ctory=3Dlist[ProfileIdentifierType])
+
+
+@dataclass(kw_only=3DTrue)
+class SpdxDocument(ElementCollection):
+    """https://spdx.github.io/spdx-spec/v3.0.1/model/Core/Classes/SpdxDo=
cument/"""
+
+    type: str =3D field(init=3DFalse, default=3D"SpdxDocument")
+    import_: list[ExternalMap] =3D field(default_factory=3Dlist[External=
Map])
+    namespaceMap: list[NamespaceMap] =3D field(default_factory=3Dlist[Na=
mespaceMap])
+
+    def to_dict(self) -> dict[str, Any]:
+        return {("import" if k =3D=3D "import_" else k): v for k, v in s=
uper().to_dict().items()}
+
+
+@dataclass(kw_only=3DTrue)
+class ExternalIdentifier(SpdxObject):
+    """https://spdx.github.io/spdx-spec/v3.0.1/model/Core/Classes/Extern=
alIdentifier/"""
+
+    type: str =3D field(init=3DFalse, default=3D"ExternalIdentifier")
+    externalIdentifierType: ExternalIdentifierType
+    identifier: str
+
+
+@dataclass(kw_only=3DTrue)
+class Agent(Element):
+    """https://spdx.github.io/spdx-spec/v3.0.1/model/Core/Classes/Agent/=
"""
+
+    type: str =3D field(init=3DFalse, default=3D"Agent")
+    externalIdentifier: list[ExternalIdentifier] =3D field(default_facto=
ry=3Dlist[ExternalIdentifier])
+
+
+@dataclass(kw_only=3DTrue)
+class SoftwareAgent(Agent):
+    """https://spdx.github.io/spdx-spec/v3.0.1/model/Core/Classes/Softwa=
reAgent/"""
+
+    type: str =3D field(init=3DFalse, default=3D"SoftwareAgent")
+
+
+@dataclass(kw_only=3DTrue)
+class CreationInfo(SpdxObject):
+    """https://spdx.github.io/spdx-spec/v3.0.1/model/Core/Classes/Creati=
onInfo/"""
+
+    type: str =3D field(init=3DFalse, default=3D"CreationInfo")
+    id: SpdxId =3D "_:creationinfo"
+    specVersion: str =3D SPDX_SPEC_VERSION
+    createdBy: list[Agent]
+    created: str =3D field(default_factory=3Dlambda: datetime.now(timezo=
ne.utc).strftime("%Y-%m-%dT%H:%M:%SZ"))
+    comment: str | None =3D None
+
+    def to_dict(self) -> dict[str, Any]:
+        return {("@id" if k =3D=3D "id" else k): v for k, v in super().t=
o_dict().items()}
+
+
+@dataclass(kw_only=3DTrue)
+class Relationship(Element):
+    """https://spdx.github.io/spdx-spec/v3.0.1/model/Core/Classes/Relati=
onship/"""
+
+    type: str =3D field(init=3DFalse, default=3D"Relationship")
+    relationshipType: RelationshipType
+    from_: Element  # underscore because 'from' is a reserved keyword
+    to: list[Element]
+    completeness: RelationshipCompleteness | None =3D None
+
+    def to_dict(self) -> dict[str, Any]:
+        return {("from" if k =3D=3D "from_" else k): v for k, v in super=
().to_dict().items()}
+
+
+@dataclass(kw_only=3DTrue)
+class Artifact(Element):
+    """https://spdx.github.io/spdx-spec/v3.0.1/model/Core/Classes/Artifa=
ct/"""
+
+    type: str =3D field(init=3DFalse, default=3D"Artifact")
+    builtTime: str | None =3D None
+    originatedBy: list[Agent] =3D field(default_factory=3Dlist[Agent])
+
+
+@dataclass(kw_only=3DTrue)
+class DictionaryEntry(SpdxObject):
+    """https://spdx.github.io/spdx-spec/v3.0.1/model/Core/Classes/Dictio=
naryEntry/"""
+
+    type: str =3D field(init=3DFalse, default=3D"DictionaryEntry")
+    key: str
+    value: str
diff --git a/scripts/sbom/sbom/spdx/serialization.py b/scripts/sbom/sbom/=
spdx/serialization.py
new file mode 100644
index 000000000000..c830d6b3cf19
--- /dev/null
+++ b/scripts/sbom/sbom/spdx/serialization.py
@@ -0,0 +1,56 @@
+# SPDX-License-Identifier: GPL-2.0-only OR MIT
+# Copyright (C) 2025 TNG Technology Consulting GmbH
+
+import json
+from typing import Any
+from sbom.path_utils import PathStr
+from sbom.spdx.core import SPDX_SPEC_VERSION, SpdxDocument, SpdxObject
+
+
+class JsonLdSpdxDocument:
+    """Represents an SPDX document in JSON-LD format for serialization."=
""
+
+    context: list[str | dict[str, str]]
+    graph: list[SpdxObject]
+
+    def __init__(self, graph: list[SpdxObject]) -> None:
+        """
+        Initialize a JSON-LD SPDX document from a graph of SPDX objects.
+        The graph must contain a single SpdxDocument element.
+
+        Args:
+            graph: List of SPDX objects representing the complete SPDX d=
ocument.
+        """
+        self.graph =3D graph
+        spdx_document =3D next(element for element in graph if isinstanc=
e(element, SpdxDocument))
+        self.context =3D [
+            f"https://spdx.org/rdf/{SPDX_SPEC_VERSION}/spdx-context.json=
ld",
+            {namespaceMap.prefix: namespaceMap.namespace for namespaceMa=
p in spdx_document.namespaceMap},
+        ]
+        spdx_document.namespaceMap =3D []
+
+    def to_dict(self) -> dict[str, Any]:
+        """
+        Convert the SPDX document to a dictionary representation suitabl=
e for JSON serialization.
+
+        Returns:
+            Dictionary with @context and @graph keys following JSON-LD f=
ormat.
+        """
+        return {
+            "@context": self.context,
+            "@graph": [item.to_dict() for item in self.graph],
+        }
+
+    def save(self, path: PathStr, prettify: bool) -> None:
+        """
+        Save the SPDX document to a JSON file.
+
+        Args:
+            path: File path where the document will be saved.
+            prettify: Whether to pretty-print the JSON with indentation.
+        """
+        with open(path, "w", encoding=3D"utf-8") as f:
+            if prettify:
+                json.dump(self.to_dict(), f, indent=3D2)
+            else:
+                json.dump(self.to_dict(), f, separators=3D(",", ":"))
diff --git a/scripts/sbom/sbom/spdx/simplelicensing.py b/scripts/sbom/sbo=
m/spdx/simplelicensing.py
new file mode 100644
index 000000000000..750ddd24ad89
--- /dev/null
+++ b/scripts/sbom/sbom/spdx/simplelicensing.py
@@ -0,0 +1,20 @@
+# SPDX-License-Identifier: GPL-2.0-only OR MIT
+# Copyright (C) 2025 TNG Technology Consulting GmbH
+
+from dataclasses import dataclass, field
+from sbom.spdx.core import Element
+
+
+@dataclass(kw_only=3DTrue)
+class AnyLicenseInfo(Element):
+    """https://spdx.github.io/spdx-spec/v3.0.1/model/SimpleLicensing/Cla=
sses/AnyLicenseInfo/"""
+
+    type: str =3D field(init=3DFalse, default=3D"simplelicensing_AnyLice=
nseInfo")
+
+
+@dataclass(kw_only=3DTrue)
+class LicenseExpression(AnyLicenseInfo):
+    """https://spdx.github.io/spdx-spec/v3.0.1/model/SimpleLicensing/Cla=
sses/LicenseExpression/"""
+
+    type: str =3D field(init=3DFalse, default=3D"simplelicensing_License=
Expression")
+    simplelicensing_licenseExpression: str
diff --git a/scripts/sbom/sbom/spdx/software.py b/scripts/sbom/sbom/spdx/=
software.py
new file mode 100644
index 000000000000..208e0168b939
--- /dev/null
+++ b/scripts/sbom/sbom/spdx/software.py
@@ -0,0 +1,71 @@
+# SPDX-License-Identifier: GPL-2.0-only OR MIT
+# Copyright (C) 2025 TNG Technology Consulting GmbH
+
+from dataclasses import dataclass, field
+from typing import Literal
+from sbom.spdx.core import Artifact, ElementCollection, IntegrityMethod
+
+
+SbomType =3D Literal["source", "build"]
+FileKindType =3D Literal["file", "directory"]
+SoftwarePurpose =3D Literal[
+    "source",
+    "archive",
+    "library",
+    "file",
+    "data",
+    "configuration",
+    "executable",
+    "module",
+    "application",
+    "documentation",
+    "other",
+]
+ContentIdentifierType =3D Literal["gitoid", "swhid"]
+
+
+@dataclass(kw_only=3DTrue)
+class Sbom(ElementCollection):
+    """https://spdx.github.io/spdx-spec/v3.0.1/model/Software/Classes/Sb=
om/"""
+
+    type: str =3D field(init=3DFalse, default=3D"software_Sbom")
+    software_sbomType: list[SbomType] =3D field(default_factory=3Dlist[S=
bomType])
+
+
+@dataclass(kw_only=3DTrue)
+class ContentIdentifier(IntegrityMethod):
+    """https://spdx.github.io/spdx-spec/v3.0.1/model/Software/Classes/Co=
ntentIdentifier/"""
+
+    type: str =3D field(init=3DFalse, default=3D"software_ContentIdentif=
ier")
+    software_contentIdentifierType: ContentIdentifierType
+    software_contentIdentifierValue: str
+
+
+@dataclass(kw_only=3DTrue)
+class SoftwareArtifact(Artifact):
+    """https://spdx.github.io/spdx-spec/v3.0.1/model/Software/Classes/So=
ftwareArtifact/"""
+
+    type: str =3D field(init=3DFalse, default=3D"software_Artifact")
+    software_primaryPurpose: SoftwarePurpose | None =3D None
+    software_additionalPurpose: list[SoftwarePurpose] =3D field(default_=
factory=3Dlist[SoftwarePurpose])
+    software_copyrightText: str | None =3D None
+    software_contentIdentifier: list[ContentIdentifier] =3D field(defaul=
t_factory=3Dlist[ContentIdentifier])
+
+
+@dataclass(kw_only=3DTrue)
+class Package(SoftwareArtifact):
+    """https://spdx.github.io/spdx-spec/v3.0.1/model/Software/Classes/Pa=
ckage/"""
+
+    type: str =3D field(init=3DFalse, default=3D"software_Package")
+    name: str  # type: ignore
+    software_packageVersion: str | None =3D None
+    software_downloadLocation: str | None =3D None
+
+
+@dataclass(kw_only=3DTrue)
+class File(SoftwareArtifact):
+    """https://spdx.github.io/spdx-spec/v3.0.1/model/Software/Classes/Fi=
le/"""
+
+    type: str =3D field(init=3DFalse, default=3D"software_File")
+    name: str  # type: ignore
+    software_fileKind: FileKindType | None =3D None
diff --git a/scripts/sbom/sbom/spdx/spdxId.py b/scripts/sbom/sbom/spdx/sp=
dxId.py
new file mode 100644
index 000000000000..589e85c5f706
--- /dev/null
+++ b/scripts/sbom/sbom/spdx/spdxId.py
@@ -0,0 +1,36 @@
+# SPDX-License-Identifier: GPL-2.0-only OR MIT
+# Copyright (C) 2025 TNG Technology Consulting GmbH
+
+from itertools import count
+from typing import Iterator
+
+SpdxId =3D str
+
+
+class SpdxIdGenerator:
+    _namespace: str
+    _prefix: str | None =3D None
+    _counter: Iterator[int]
+
+    def __init__(self, namespace: str, prefix: str | None =3D None) -> N=
one:
+        """
+        Initialize the SPDX ID generator with a namespace.
+
+        Args:
+            namespace: The full namespace to use for generated IDs.
+            prefix: Optional. If provided, generated IDs will use this p=
refix instead of the full namespace.
+        """
+        self._namespace =3D namespace
+        self._prefix =3D prefix
+        self._counter =3D count(0)
+
+    def generate(self) -> SpdxId:
+        return f"{f'{self._prefix}:' if self._prefix else self._namespac=
e}{next(self._counter)}"
+
+    @property
+    def prefix(self) -> str | None:
+        return self._prefix
+
+    @property
+    def namespace(self) -> str:
+        return self._namespace
--=20
2.34.1


